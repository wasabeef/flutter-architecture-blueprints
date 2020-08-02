# Flutter Architecture Blueprints

<p align="center">
  <img width="85%" src="./art/cover.png">
</p>

Flutter Architecture Blueprint is a project that introduces different architectures and project structure approaches to developing Flutter apps.

## Concept

**Make it easy.**

## Getting Started

### Requirements

- [Flutter (beta channel)](https://flutter.dev/docs/get-started/install)
- [Dart 2.9.0+ (beta channel)](https://github.com/dart-lang/sdk/wiki/Installing-beta-and-dev-releases-with-brew,-choco,-and-apt-get#installing)
- [npm](https://treehouse.github.io/installation-guides/mac/node-mac.html)

**iOS**
- iOS 13+

**Android**
- Android 5.1+
- minSdkVersion 22
- targetSdkVersion 30
- ndkVersion 21.3.6528147 [(Specific version installing)](https://developer.android.com/studio/projects/install-ndk#specific-version)

### Setup
```shell script
$ make setup
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

## Collections

**Architecture**
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Base | Riverpods + StateNotifier |-|
| □ | Networking | dio |-|
| □ | Persistent Data | sqflite |-|
| □ | Error handling |  |-|

**UI**
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Page | - |-|
| □ | Component | - |-|
| □ | Animation | - |-|

**Testing**
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | API | - |-|
| □ | Data | - |-|
| □ | UI | - |-|

**Project settings**
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Base | Switching between Development and Production environment | Flutter([flavor.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/flavor.dart), [runConfigurations](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/.idea/runConfigurations), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/Makefile#L14-L28)), iOS([xcconfig](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/ios/Config), [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/ios/Podfile#L7-L12)), Android([build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L50-L75), [Flavor dirs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/android/app/src), [signingConfigs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/android/app/signingConfigs)) |
| ✅ | Android | Kotlin version | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/build.gradle#L2) |
| ✅ | Android | Apk attributes | build.gradle ([compileSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L29), [applicationId](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L43), [minSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L44), [targetSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L45), [ndkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/app/build.gradle#L30)) |
| □ | iOS | iOS info.plist |-|
| ✅ | Dart | Lint / Analyze | [analysis_options.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/analysis_options.yaml) |
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/package.json#L4-L8), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/.gitignore) |

**CI**
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| □ | Build | Github Actions |-|
| □ | Build | Bitrise |-|
| □ | Distributing | Firebase App Distribution |-|
| □ | Distributing | Google Play |-|
| □ | Distributing | Apple Store |-|
