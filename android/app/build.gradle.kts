plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
}

android {
    namespace = "com.aronwolf.todos"
    compileSdk = 35
    flavorDimensions += "default"

    defaultConfig {
        applicationId = "com.aronwolf.todos"
        minSdk = 28
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }

    productFlavors {
        create("remoteServer") {
            dimension = "default"
            isDefault = true
            buildConfigField("String", "BASE_URL", "\"https://todos.webcloudpower.com\"")
        }
        create("localServer") {
            dimension = "default"
            applicationIdSuffix = "localServer"
            versionNameSuffix = "-localServer"
            buildConfigField("String", "BASE_URL", "\"http://10.0.2.2:3000\"")
        }
    }

    testOptions {
        emulatorControl {
            enable = true
        }
    }
}

dependencies {

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.material)
    implementation(libs.androidx.activity)
    implementation(libs.androidx.constraintlayout)
    implementation("dev.hotwire:core:1.0.2")
    implementation("dev.hotwire:navigation-fragments:1.0.2")
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation("androidx.test.espresso:espresso-device:1.0.1")
    androidTestImplementation("androidx.test.espresso:espresso-web:3.6.1")
}