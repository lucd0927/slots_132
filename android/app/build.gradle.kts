plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
//    id("com.google.gms.google-services")
}

android {
    namespace = "com.cdsls.slots_132"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.cdsls.slots_132"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 26
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}


dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")

//    //Max
//    implementation("com.applovin.mediation:bidmachine-adapter:+")
//    implementation("com.applovin.mediation:bigoads-adapter:+")
//    implementation("com.applovin.mediation:chartboost-adapter:+")
//    implementation("com.google.android.gms:play-services-base:+")
//    implementation("com.applovin.mediation:google-ad-manager-adapter:+")
//    implementation("com.applovin.mediation:google-adapter:+")
//
//    implementation("com.applovin.mediation:inmobi-adapter:+")
//    implementation("com.squareup.picasso:picasso:+") // todo
//    implementation("androidx.recyclerview:recyclerview:1.1.0")
//
//    implementation("com.applovin.mediation:ironsource-adapter:+")
//    implementation("com.applovin.mediation:vungle-adapter:+") // Liftoff Monetize
//    implementation("com.applovin.mediation:facebook-adapter:+")
//    implementation("com.applovin.mediation:mintegral-adapter:+")
//    implementation("com.applovin.mediation:moloco-adapter:+")
//    implementation("com.applovin.mediation:bytedance-adapter:+")
//    implementation("com.applovin.mediation:unityads-adapter:4.16.3.0")
//    implementation("com.applovin.mediation:fyber-adapter:+")


//    //TU (Necessary)
//    api("com.thinkup.sdk:core-tpn:6.5.36")
//    api("com.thinkup.sdk:nativead-tpn:6.5.36")
//    api("com.thinkup.sdk:banner-tpn:6.5.36")
//    api("com.thinkup.sdk:interstitial-tpn:6.5.36")
//    api("com.thinkup.sdk:rewardedvideo-tpn:6.5.36")
//    api("com.thinkup.sdk:splash-tpn:6.5.36")
////Androidx (Necessary)
//    api("androidx.appcompat:appcompat:1.6.1")
//    api("androidx.browser:browser:1.4.0")
////Vungle
//    api("com.thinkup.sdk:adapter-tpn-vungle:6.5.36")
//    api("com.vungle:vungle-ads:7.5.0")
//    api("com.google.android.gms:play-services-basement:18.1.0")
//    api("com.google.android.gms:play-services-ads-identifier:18.0.1")
////UnityAds
//    api("com.thinkup.sdk:adapter-tpn-unityads:6.5.36")
//    api("com.unity3d.ads:unity-ads:4.16.1")
////Ironsource
//    api("com.thinkup.sdk:adapter-tpn-ironsource:6.5.36")
////    api("com.ironsource.sdk:mediationsdk:8.10.0")
//    api("com.google.android.gms:play-services-appset:16.0.2")
//    api("com.google.android.gms:play-services-ads-identifier:18.0.1")
//    api("com.google.android.gms:play-services-basement:18.1.0")
////Bigo
//    api("com.thinkup.sdk:adapter-tpn-bigo:6.5.36")
//    api("com.bigossp:bigo-ads:5.5.1")
////Pangle
//    api("com.thinkup.sdk:adapter-tpn-pangle:6.5.36")
//    api("com.pangle.global:pag-sdk:7.6.0.2")
//    api("com.google.android.gms:play-services-ads-identifier:18.2.0")
////Kwai
//    api("com.thinkup.sdk:adapter-tpn-kwai:6.5.36.1")
//    api("io.github.kwainetwork:adApi:1.2.21")
//    api("io.github.kwainetwork:adImpl:1.2.21")
//    api("androidx.media3:media3-exoplayer:1.0.0-alpha01")
//    api("androidx.appcompat:appcompat:1.6.1")
//    api("com.google.android.material:material:1.2.1")
//    api("androidx.annotation:annotation:1.2.0")
//    api("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.4.10")
//    api("com.google.android.gms:play-services-ads-identifier:18.0.1")
////Facebook
//    api("com.thinkup.sdk:adapter-tpn-facebook:6.5.36")
//    api("com.facebook.android:audience-network-sdk:6.20.0")
//    api("androidx.annotation:annotation:1.0.0")
////Admob
//    api("com.thinkup.sdk:adapter-tpn-admob:6.5.36")
//    api("com.google.android.gms:play-services-ads:24.6.0")
////Inmobi
//    api("com.thinkup.sdk:adapter-tpn-inmobi:6.5.36")
//    api("com.inmobi.monetization:inmobi-ads-kotlin:10.8.7")
////TU Adx SDK(Necessary)
//    api("com.thinkup.sdk:adapter-tpn-sdm:6.5.36.2")
//    api("com.smartdigimkttech.sdk:smartdigimkttech-sdk:6.5.38")
////AppLovin
//    api("com.thinkup.sdk:adapter-tpn-applovin:6.5.36")
//    api("com.applovin:applovin-sdk:13.4.0")
////Mintegral
//    api("com.thinkup.sdk:adapter-tpn-mintegral:6.5.36")
//    api("com.mbridge.msdk.oversea:mbridge_android_sdk:16.9.91")
//    api("androidx.recyclerview:recyclerview:1.1.0")
////Chartboost
//    api("com.thinkup.sdk:adapter-tpn-chartboost:6.5.36")
//    api("com.chartboost:chartboost-sdk:9.8.3")
//    api("com.chartboost:chartboost-mediation-sdk:4.9.2")
//    api("com.chartboost:chartboost-mediation-adapter-chartboost:4.9.8.1.0")
//    api("com.jakewharton.retrofit:retrofit2-kotlinx-serialization-converter:1.0.0")
//    api("com.squareup.okhttp3:logging-interceptor:4.10.0")
//    api("com.squareup.okhttp3:okhttp:4.10.0")
//    api("com.squareup.retrofit2:converter-scalars:2.9.0")
//    api("com.squareup.retrofit2:retrofit:2.9.0")
//    api("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.1")
//    api("org.jetbrains.kotlinx:kotlinx-serialization-json:1.5.1")
////Fyber
//    api("com.thinkup.sdk:adapter-tpn-fyber:6.5.36")
//    api("com.fyber:marketplace-sdk:8.3.7")
//    api("com.google.android.gms:play-services-ads-identifier:18.0.1")
////Tramini
//    api("com.thinkup.sdk:tramini-plugin-tpn:6.5.36")

    api("io.github.alex-only:max_adapter_tu:1.2.5")
}
