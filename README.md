# Flutter Architecture Blueprints

<p align="center">
  <img width="85%" src="./art/cover.png">
</p>

<p align="center">
  <a href="https://app.bitrise.io/app/bc96b48850888851"><img src="https://app.bitrise.io/app/bc96b48850888851/status.svg?token=kpOAmHRna6NiMkHYsosrlA"></a>
  <a href="https://codemagic.io/apps/5f2c1b6a8ff73d000f7bc1e1/5f2c1b6a8ff73d000f7bc1e0/latest_build"><img src="https://api.codemagic.io/apps/5f2c1b6a8ff73d000f7bc1e1/5f2c1b6a8ff73d000f7bc1e0/status_badge.svg"></a>
  <a href="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints">
    <img src="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints/branch/master/graph/badge.svg?token=9NCYY33KNG" />
  </a>
</p>

Flutter Architecture Blueprint is a project that introduces different architectures and project structure approaches to developing Flutter apps.

## Documentation

* [Install Flutter](https://flutter.dev/get-started/)
* [Flutter documentation](https://flutter.dev/docs)
* [Contributing to Flutter](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/CONTRIBUTING.md)

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
- ndkVersion 21.0.6113669 [(Specific version installing)](https://developer.android.com/studio/projects/install-ndk#specific-version)

## Code collections

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

#### Architecture

|Working status|Category|Description|Codes|
|:---:|---|---|---|
| 🤔 | Base | Riverpods + Hooks + ChangeNotifier + Android MVVM-ish |-|
| ✅ | Networking | dio |-|
| ✅ | Caching | dio_http_cache  |-|
| ✅ | Persist Data | shared_preferences |-|
| ✅ | Constants | Define constants | [constants.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/constants.dart) |
| ✅ | Localization | Switching between two languages | [l10n dir](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/lib/l10n), [context.localized](https://github.com/wasabeef/flutter-architecture-blueprints/blob/b93557b5fe790d8e386136a820d9b0713c2e7950/lib/view/MyHomePage.dart#L24) |
| 🤔 | Error handling |  |-|

#### UI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Theme | - |-|

#### Testing
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | API | - |-|
| □ | UI | - |-|

#### CI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/package.json#L4-L11), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/.gitignore) |
| ✅ | Build | Codemagic |[codemagic.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/codemagic.yaml)|
| ✅ | Build | Bitrise |[bitrise.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/bitrise.yml)|
| □ | Build | Github Actions |-|
| □ | Distributing | Firebase App Distribution |-|


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
