pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("com.android.library") version "9.0.1" apply false
    // KGP version is intentionally kept consistent with example/android/settings.gradle.kts.
    // The cross-drive incremental compilation crash is fixed via android/gradle.properties
    // (kotlin.incremental=false) — not by downgrading KGP.
    // See: FLUTTER_PLUGIN_FIXES.md — Fix 1
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

rootProject.name = "native_android_path"
