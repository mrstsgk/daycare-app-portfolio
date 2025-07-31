plugins {
    id("org.springframework.boot") version "3.2.6"
    id("io.spring.dependency-management") version "1.1.4"
    kotlin("jvm") version "1.9.23"
    kotlin("plugin.spring") version "1.9.23"
    id("org.flywaydb.flyway") version "10.13.0"
    id("nu.studer.jooq") version "8.2"
    id("io.gitlab.arturbosch.detekt") version "1.23.6"
    // OpenAPI Generatorを最新版に更新
    id("org.openapi.generator") version "7.8.0"
}

// buildscriptでFlywayプラグイン用の依存関係を明示的に設定
buildscript {
    dependencies {
        classpath("org.flywaydb:flyway-database-postgresql:10.13.0")
        classpath("org.postgresql:postgresql:42.7.3")
        // SnakeYAMLのバージョンを最新版に更新
        classpath("org.yaml:snakeyaml:2.2")
    }
}

// OpenAPI Generator設定 - モデルファイルのみ生成
openApiGenerate {
    generatorName.set("kotlin-spring")
    inputSpec.set("$projectDir/openapi/api.yaml")
    outputDir.set("$projectDir/temp-openapi-gen")
    packageName.set("com.example.daycare.presentation")
    modelPackage.set("com.example.daycare.presentation.model")
    configOptions.put("useSpringBoot3", "true")
    configOptions.put("modelOnly", "true")
    configOptions.put("interfaceOnly", "false")
    configOptions.put("skipDefaultInterface", "true")
    configOptions.put("generateApis", "false")
    configOptions.put("generateApiTests", "false")
    configOptions.put("generateApiDocumentation", "false")
    configOptions.put("generateModelTests", "false")
    configOptions.put("generateModelDocumentation", "false")
    configOptions.put("generateSupportingFiles", "false")
    // Serializableエラーを回避するための設定
    configOptions.put("enumPropertyNaming", "original")
    configOptions.put("useSerializableModel", "false")
    configOptions.put("enumUnknownDefaultCase", "false")
    configOptions.put("generateConstructorPropertiesAnnotation", "false")
    // @Schemaアノテーションのみを生成しない設定（Bean Validationは保持）
    configOptions.put("useBeanValidation", "true")
    configOptions.put("useSwaggerAnnotations", "false")
    configOptions.put("serializationLibrary", "jackson")
    configOptions.put("generateNullableAnnotations", "false")
    configOptions.put("enumUnknownDefaultCase", "false")
    configOptions.put("serializableModel", "false")
    // カスタムテンプレートディレクトリを指定
    templateDir.set("$projectDir/openapi-templates")
    // 特定のファイルのみ生成対象から除外
    globalProperties.put("models", "")
    globalProperties.put("apis", "false")
}

// 生成されたモデルファイルを適切な場所にコピー
tasks.register("copyOpenApiModels") {
    dependsOn("openApiGenerate")
    doLast {
        val srcDir = file("$projectDir/temp-openapi-gen/src/main/kotlin")
        val destDir = file("$projectDir/presentation/src/main/kotlin")

        if (srcDir.exists()) {
            srcDir.copyRecursively(destDir, overwrite = true)
        }

        // 一時ディレクトリをクリーンアップ
        delete("$projectDir/temp-openapi-gen")
    }
}

// @Schemaアノテーションを削除するタスク
tasks.register("removeSchemaAnnotations") {
    dependsOn("copyOpenApiModels")
    doLast {
        exec {
            commandLine("sh", "$projectDir/remove-schema-annotations.sh")
        }
    }
}

// @field:NotNullアノテーションを追加するタスク
tasks.register("addNotNullAnnotations") {
    dependsOn("removeSchemaAnnotations")
    doLast {
        exec {
            commandLine("sh", "$projectDir/add-not-null-annotations.sh")
        }
    }
}

// openApiGenerateの後に自動実行
tasks.named("openApiGenerate") {
    finalizedBy("addNotNullAnnotations")
}

// Flyway設定を更新
flyway {
    url = "jdbc:postgresql://localhost:5432/daycare"
    user = "daycareuser"
    password = "daycarepass"
    locations = arrayOf("filesystem:migration")
    baselineOnMigrate = true
    baselineVersion = "0"
    driver = "org.postgresql.Driver"
    cleanDisabled = false
}

allprojects {
    group = "com.example"
    version = "0.0.1-SNAPSHOT"

    repositories {
        mavenCentral()
    }
}

subprojects {
    apply(plugin = "org.jetbrains.kotlin.jvm")
    apply(plugin = "org.jetbrains.kotlin.plugin.spring")
    apply(plugin = "io.spring.dependency-management")

    java.sourceCompatibility = JavaVersion.VERSION_21

    dependencyManagement {
        imports {
            mavenBom("org.springframework.boot:spring-boot-dependencies:3.2.6")
        }
    }

    dependencies {
        implementation("org.jetbrains.kotlin:kotlin-reflect")
        implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
    }

    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
        kotlinOptions {
            freeCompilerArgs = listOf("-Xjsr305=strict")
            jvmTarget = "21"
        }
    }

    tasks.withType<Test> {
        useJUnitPlatform()
    }
}

dependencies {
    implementation(project(":presentation"))
    implementation(project(":usecase"))
    implementation(project(":infrastructure"))
    implementation(project(":domain"))
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-data-jdbc")
    implementation("org.postgresql:postgresql:42.7.3")
    implementation("org.flywaydb:flyway-core")
    implementation("org.jooq:jooq:3.20.0")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
    implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.5.0")
    implementation("org.springframework.boot:spring-boot-starter-validation")
    implementation("org.yaml:snakeyaml:2.0")
    testImplementation("io.kotest:kotest-runner-junit5:5.8.1")
    testImplementation("io.kotest:kotest-assertions-core:5.8.1")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<Test> {
    useJUnitPlatform()
}

detekt {
    buildUponDefaultConfig = true
    allRules = false
    config.setFrom(files("$projectDir/detekt/detekt.yml"))
}

kotlin {
    jvmToolchain(21)
}

tasks.named("check") {
    dependsOn.removeAll { it is TaskProvider<*> && it.name == "detekt" }
}

// 通常のjarタスクを無効化し、bootJarのみ有効化
tasks.getByName<Jar>("jar") {
    enabled = false
}
