plugins {
    id("org.springframework.boot") version "3.2.6"
    id("io.spring.dependency-management") version "1.1.4"
    kotlin("jvm") version "1.9.23"
    kotlin("plugin.spring") version "1.9.23"
    id("org.flywaydb.flyway") version "10.13.0"
    id("nu.studer.jooq") version "9.0"
    id("io.gitlab.arturbosch.detekt") version "1.23.6"
}

group = "com.example"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_21

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-data-jdbc")
    implementation("org.postgresql:postgresql:42.7.3")
    implementation("org.flywaydb:flyway-core")
    implementation("org.jooq:jooq:3.19.8")
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