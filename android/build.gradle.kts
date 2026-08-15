group = "com.example.native_android_path"
version = "1.0-SNAPSHOT"

plugins {
    id("com.android.library")
}

// Apply KGP only if the host app hasn't requested built-in Kotlin support.
val builtInKotlin = providers
    .gradleProperty("android.builtInKotlin")
    .orElse("false")
    .get()
    .trim()
    .equals("true", ignoreCase = true)

if (!builtInKotlin) {
    apply(plugin = "org.jetbrains.kotlin.android")
}

android {
    namespace = "com.example.native_android_path"

    compileSdk = 36

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
        getByName("test") {
            java.srcDirs("src/test/kotlin")
        }
    }

    defaultConfig {
        minSdk = 24
    }

    testOptions {
        unitTests {
            isIncludeAndroidResources = true
            all {
                it.useJUnitPlatform()

                it.outputs.upToDateWhen { false }

                it.testLogging {
                    events("passed", "skipped", "failed", "standardOut", "standardError")
                    showStandardStreams = true
                }
            }
        }
    }
}

// Use this instead of kotlinOptions (supports both AGP 8 and AGP 9)
project.extensions.configure(
    org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension::class.java
) {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    testImplementation("org.jetbrains.kotlin:kotlin-test")
    testImplementation("org.mockito:mockito-core:5.0.0")
}
