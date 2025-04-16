plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.intuji_infogrid"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"
     //  ndkVersion = "25.1.8937393"


    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.intuji_infogrid"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    flavorDimensions += "default"
    productFlavors {
        create("uat") {
            dimension = "default"
            applicationIdSuffix = ".uat"
            resValue(
                type = "string",
                name = "app_name",
                value = "[UAT]Info Grid")
        }
        create("prod") {
            dimension = "default"
            applicationIdSuffix = ""
            resValue(
                type = "string",
                name = "app_name",
                value = "Info Grid")
        }
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            resValue(
                type = "string",
                name = "app_name",
                value = "[DEV]Info Grid")
        }
    }

}

flutter {
    source = "../.."
}
