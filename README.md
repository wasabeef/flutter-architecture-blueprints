# Flutter Architecture Blueprints

<p align="center">
  <img width="85%" src="./art/cover.png">
</p>

Flutter Architecture Blueprint is a project that introduces different architectures and project structure approaches to developing Flutter apps.

## Concept

**Make it easy.**

## Requirements

- [Flutter (beta channel)](https://flutter.dev/docs/get-started/install)
- [Dart 2.9.0+ (beta channel)](https://github.com/dart-lang/sdk/wiki/Installing-beta-and-dev-releases-with-brew,-choco,-and-apt-get#installing)
- [npm](https://treehouse.github.io/installation-guides/mac/node-mac.html)

## Environment

**iOS**
- iOS 13+
- compatibilityVersion "Xcode 9.3"

**Android**
- Android 5.1+
- minSdkVersion 22
- targetSdkVersion 30
- ndkVersion 21.3.6528147 [(Specific version installing)](https://developer.android.com/studio/projects/install-ndk#specific-version)

## Collections

#### Architecture
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Base | Riverpods + Hooks+ StateNotifier |-|
| □ | Networking | dio |-|
| □ | Cache and Persist Data | sqflite |-|
| □ | Constants | - |-|
| □ | Localization | - |-|
| □ | Error handling |  |-|

#### UI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Theme | - |-|
| □ | Page | - |-|
| □ | Component | - |-|
| □ | Animation | - |-|

#### Testing
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | API | - |-|
| □ | Data | - |-|
| □ | UI | - |-|

#### Project settings
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Dart | Dart version | [pubspec.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/a639f51ebd0d49a64ae1a6f0fa434b5a52fd01d7/pubspec.yaml#L21) |
| ✅ | Dart | Switching between Development and Production environment | [flavor.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/flavor.dart), [runConfigurations](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/.idea/runConfigurations), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/Makefile#L14-L28) |
| ✅ | Dart | Lint / Analyze | [analysis_options.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/analysis_options.yaml) |
| ✅ | Android | Kotlin version | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/build.gradle#L2) |
| ✅ | Android | Apk attributes | build.gradle ([compileSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L29), [applicationId](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L43), [minSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L44), [targetSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L45), [ndkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L30) |
| ✅ | Android | Switching between Development and Production environment | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L50-L75), [Flavor dirs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/android/app/src), [signingConfigs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/android/app/signingConfigs) |
| ✅ | iOS | Xcode version | [compatibilityVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/3ae7135cc040fecf5bbb2100a353f6594037752d/ios/Runner.xcodeproj/project.pbxproj#L182) |
| ✅ | iOS | Podfile | [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/ios/Podfile) |
| ✅ | iOS | Switching between Development and Production environment | [xcconfig](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/ios/Config), [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/ios/Podfile#L7-L12) |
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/package.json#L4-L11), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/.gitignore) |

#### CI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Build | Github Actions |-|
| □ | Build | Bitrise |-|
| □ | Distributing | Firebase App Distribution |-|
| □ | Distributing | Google Play |-|
| □ | Distributing | Apple Store |-|


## Getting Started

### Setup
```shell script
$ make setup
$ make build-runner
```

### Make .apk and .ipa file
Android
```shell script
$ make build-dev-apk
$ make build-prd-apk
```

iOS
```shell script
$ make build-dev-ipa
$ make build-prd-ipa
```
