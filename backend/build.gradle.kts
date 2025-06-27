plugins {
    id("org.springframework.boot") version "3.2.6"
    id("io.spring.dependency-management") version "1.1.4"
    kotlin("jvm") version "1.9.23"
    kotlin("plugin.spring") version "1.9.23"
    id("org.flywaydb.flyway") version "10.13.0"
    id("nu.studer.jooq") version "8.2"
    id("io.gitlab.arturbosch.detekt") version "1.23.6"
}

// buildscriptでFlywayプラグイン用の依存関係を明示的に設定
buildscript {
    dependencies {
        classpath("org.flywaydb:flyway-database-postgresql:10.13.0")
        classpath("org.postgresql:postgresql:42.7.3")
    }
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
