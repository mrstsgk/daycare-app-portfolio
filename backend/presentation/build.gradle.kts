plugins {
    kotlin("jvm")
    id("io.spring.dependency-management")
}

group = "com.example"
version = "0.0.1-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation(project(":usecase"))
    implementation(project(":infrastructure"))
    implementation(project(":domain"))
    implementation("org.springframework.boot:spring-boot-starter-web:3.2.6")
    implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.5.0")
    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(21)
}
