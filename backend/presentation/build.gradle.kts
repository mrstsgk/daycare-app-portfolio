import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

group = "org.openapitools"
version = "1.0.0"
java.sourceCompatibility = JavaVersion.VERSION_21

repositories {
    mavenCentral()
    maven { url = uri("https://repo.spring.io/milestone") }
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "21"
    kotlinOptions.freeCompilerArgs = listOf("-Xjsr305=strict")
}

plugins {
    val kotlinVersion = "1.9.23"
    id("org.jetbrains.kotlin.jvm") version kotlinVersion
    id("org.jetbrains.kotlin.plugin.spring") version kotlinVersion
    id("io.spring.dependency-management") version "1.1.4"
}

dependencies {
    // プロジェクト内依存関係
    implementation(project(":domain"))
    implementation(project(":usecase"))

    // Spring Boot
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-validation")
    implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.2.0")

    // Jackson (XMLはSpring Boot Starterに含まれるため削除)
    implementation("com.fasterxml.jackson.dataformat:jackson-dataformat-yaml")

    // テスト依存関係
    testImplementation("org.springframework.boot:spring-boot-starter-test")
    testImplementation("io.kotest:kotest-runner-junit5:5.8.1")
    testImplementation("io.kotest:kotest-assertions-core:5.8.1")
}
