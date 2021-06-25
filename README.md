# Flutter Architecture Blueprints


<p align="center">
  <img src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/cover.png" />
</p>

<p align="center">
  <a href="https://app.bitrise.io/app/bc96b48850888851">
    <img src="https://app.bitrise.io/app/bc96b48850888851/status.svg?token=kpOAmHRna6NiMkHYsosrlA">
  </a>
  <a href="https://codemagic.io/apps/5f2fd2f0cfa9364ecb48c64e/5f2fd2f0cfa9364ecb48c64d/latest_build">
    <img src="https://api.codemagic.io/apps/5f2fd2f0cfa9364ecb48c64e/5f2fd2f0cfa9364ecb48c64d/status_badge.svg">
  </a>
  <a href="https://github.com/wasabeef/flutter-architecture-blueprints/actions?query=workflow%3A%22Flutter+CI%22">
    <img src="https://github.com/wasabeef/flutter-architecture-blueprints/workflows/Flutter%20CI/badge.svg?branch=master" />
  </a>
  <a href="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints">
    <img src="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints/branch/main/graph/badge.svg?token=9NCYY33KNG" />
  </a>
</p>
<p align="center">
  <a href="https://twitter.com/wasabeef_jp">
    <img src="https://img.shields.io/twitter/follow/wasabeef_jp?label=%40wasabeef_jp&logoColor=000000&style=social" />
  </a>
</p>

Flutter Architecture Blueprints is a project that introduces MVVM architecture and project structure approaches to developing Flutter apps.

## Documentation

- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://flutter.dev/docs)
- [Contributing to Flutter](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/CONTRIBUTING.md)

## Requirements

- [Dart 2.13.0+ (stable channel)](https://github.com/dart-lang/sdk/wiki/Installing-beta-and-dev-releases-with-brew,-choco,-and-apt-get#installing)
- [FVM](https://github.com/leoafarias/fvm)
  - [Flutter 2.2.+ via FVM](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/.fvm/fvm_config.json)
- [npm (for git hooks)](https://treehouse.github.io/installation-guides/mac/node-mac.html)

## Environment

<img height="520px" src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/MVVM.jpg" align="right" />

**iOS**
- iOS 13+

**Android**
- Android 5.1+
    - minSdkVersion 22
- targetSdkVersion 30

## App architecture
- Base on [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) + [Repository](https://docs.microsoft.com/ja-jp/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design)

## Code Style
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

## Assets, Fonts

**If added some assets or fonts**

- Use [FlutterGen](https://github.com/FlutterGen/flutter_gen/)

## Models

**If added some models for api results**

- Use [Freezed](https://pub.dev/packages/freezed)

## Localizations

**If added some localizations (i.g. edited [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n))**

- Use [Official Flutter localization package](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc)

## Git Commit message style

- [Semantic Commit Messages](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)

## Code collections

#### Project settings
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Dart | Dart version | [pubspec.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/pubspec.yaml#L7-L9) |
| ✅ | [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvm/fvm_config.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/.fvm/fvm_config.json) |
| ✅ | Dart | Switching between Development and Production environment | [constants.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/foundation/constants.dart), [runConfigurations](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/.idea/runConfigurations), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/Makefile#L25-L41) |
| ✅ | Dart | Lint / Analyze | [analysis_options.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/analysis_options.yaml) |
| ✅ | Android | Kotlin version | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/android/build.gradle#L2) |
| ✅ | Android | Apk attributes | build.gradle ([compileSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L30), [applicationId](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L43), [minSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L44), [targetSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L45)) |
| ✅ | Android | Switching between Development and Production environment | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L50-L75), [Flavor dirs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/android/app/src), [signingConfigs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/android/app/signingConfigs) |
| ✅ | iOS | Xcode version | [compatibilityVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/3ae7135cc040fecf5bbb2100a353f6594037752d/ios/Runner.xcodeproj/project.pbxproj#L182) |
| ✅ | iOS | Podfile | [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/ios/Podfile) |
| ✅ | iOS | Switching between Development and Production environment | [xcconfig](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/ios/Config), [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/ios/Podfile#L7-L12) |
| ✅ | [Firebase](https://firebase.flutter.dev/docs/overview) | [Android] Switching between Development and Production google-service.json using flavors | [development and production](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/android/app/src) |
| ✅ | [Firebase](https://firebase.flutter.dev/docs/overview) | [iOS] Switching between Development and Production GoogleService-Info.plist using run script| [copy_google_service.sh](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/ios/Scripts/copy_google_service.sh), [development and production](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/ios/Runner/Resources/Firebase) |
| ✅ | [Firebase Auth](https://firebase.flutter.dev/docs/auth/overview) | SignIn, SignOut | [auth_data_source_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/remote/auth_data_source_impl.dart) |
| ✅ | [Firebase Crashlytics](https://firebase.flutter.dev/docs/crashlytics/overview) | Crash Reports | [main.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/main.dart) |
| ✅ | [Firebase Performance](https://firebase.flutter.dev/docs/performance/overview) | Network monitoring with [dio_firebase_performance](https://pub.dev/packages/dio_firebase_performance) | [app_dio.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/eb749c742216088cbf2ff821f463e3de02d7d3b3/lib/data/remote/app_dio.dart#L27-L28) |

#### Architecture

|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Base | Using [Riverpod](https://pub.dev/packages/riverpod) + [Hooks](https://pub.dev/packages/flutter_hooks) + [ChangeNotifier](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#changenotifier) + MVVM | [news_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/ui/news/news_page.dart), [news_view_model.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/ui/news/news_view_model.dart), [news_repository.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/repository/news_repository.dart), [news_data_source.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/remote/news_data_source.dart) |
| ✅ | Networking | Using [dio](https://pub.dev/packages/dio) and [Retofit](https://pub.dev/packages/retrofit) | [app_dio.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/remote/app_dio.dart), [news_data_source.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/remote/news_data_source.dart) |
| ✅ | Data | Using [Freezed](https://pub.dev/packages/freezed) | [model classes](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/model) |
| ✅ | Constants | Define constants and route names | [constants.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/foundation/constants.dart) |
| ✅ | Localization | Switching between two languages with [Intl package](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/edit) | [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n) |
| ✅ | Error handling | Using Result pattern - A value that represents either a success or a failure, including an associated value in each case. | [result.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/model/result.dart), [news_repository_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/repository/news_repository_impl.dart#L16), [home_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/e8f0ed78a62e5b27609e60206bd121295a13faac/lib/ui/home/home_page.dart#L51-L63) |

#### UI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Theme | Staticly Switch between light and dark themes | [app_theme.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/app.dart#L15-L17) |
| ✅ | Font | Using [Google font](https://pub.dev/packages/google_fonts) | [app_theme.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/ui/theme/app_theme.dart#L40) |
| ✅ | Transition | Simple animation between screens using [Hero](https://flutter.dev/docs/development/ui/animations/hero-animations) | [article_item.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/component/article_item.dart#L28), [detail_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/detail/datail_page.dart#L13-L24) |

#### Testing
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | API(Repositories) | Using [mocktail](https://github.com/felangel/mocktail) | [view_mode_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/test/ui/view_model_test.dart) |
| ✅️ | UI | Using [mocktail](https://github.com/felangel/mocktail) | [widget_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/test/ui/widget_test.dart) |
| ✅ | Coverage reports | Send the report to [Codecov](https://codecov.io/) on CI |[codecov.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/codecov.yml), [codecov.sh](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/scripts/codecov.sh), [flutte-ci.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/8e2a373af5e4603aaa75d3c9b9af8150400ab46e/.github/workflows/flutter-ci.yml#L66-L71) |

#### CI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/package.json#L4-L11), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/.gitignore) |
| ✅ | Build | Using [Codemagic](https://codemagic.io/) |[codemagic.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/codemagic.yaml)|
| ✅ | Build | Using [Bitrise](https://www.bitrise.io/) |[bitrise.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/bitrise.yml)|
| ✅ | Build | Using [Github Actions](https://github.com/features/actions) | [.github/workflows/flutter-ci.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/.github/workflows/flutter-ci.yml) |

## Getting Started


### Setup

```shell script
$ make setup
$ export PATH="$PATH":"$HOME/.pub-cache/bin" # Add your run-commands (.zshrc, .bashrc, etc)
$ make dependencies
$ make build-runner
```

**And set your IDE for FVM path.**  
<img height="180px" src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/fvm-intellij-env.png"/>

<br/>

### How to add assets(images..)
1. Add assets
2. Run [FlutterGen](https://github.com/fluttergen)

### How to add localizations
1. Edit [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n) files.
2. Run generate the `flutter pub get`

<br/>

### Make .apk and .ipa file

<img height="540px" src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/running-app.gif" align="left" />

Android
```shell script
$ make build-android-dev
$ make build-android-prd
```

iOS
```shell script
$ make build-ios-dev
$ make build-ios-prd
```

### Run app
```shell script
$ make run-dev
$ make run-prd
```
## Special Thanks.

- [News API](https://newsapi.org/)

**Contributors**
- [lcdsmao](https://github.com/lcdsmao)

