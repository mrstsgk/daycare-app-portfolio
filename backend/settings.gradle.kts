plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.8.0"
}
rootProject.name = "daycare"
include("infrastructure")
include("domain")
include("usecase")
include("presentation")
