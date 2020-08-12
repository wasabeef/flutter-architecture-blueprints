# Flutter Architecture Blueprints

<p align="center">
  <img width="85%" src="./art/cover.png" />
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
    <img src="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints/branch/master/graph/badge.svg?token=9NCYY33KNG" />
  </a>
</p>
<p align="center">
  <a href="https://twitter.com/wasabeef_jp">
    <img src="https://img.shields.io/twitter/follow/wasabeef_jp?label=%40wasabeef_jp&logoColor=000000&style=social" />
  </a>
</p>

Flutter Architecture Blueprints is a project that introduces MVVM architecture and project structure approaches to developing Flutter apps.

## Documentation

<img height="520px" src="./art/MVVM.jpg" align="right" />

* [Install Flutter](https://flutter.dev/get-started/)
* [Flutter documentation](https://flutter.dev/docs)
* [Contributing to Flutter](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/CONTRIBUTING.md)

## Requirements

- [Flutter 1.20.0+ (beta channel)](https://flutter.dev/docs/get-started/install)
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

## Code collections

#### Project settings
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Dart | Dart version | [pubspec.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/a639f51ebd0d49a64ae1a6f0fa434b5a52fd01d7/pubspec.yaml#L21) |
| ✅ | Dart | Switching between Development and Production environment | [constants.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/constants.dart), [runConfigurations](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/.idea/runConfigurations), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/Makefile#L25-L41) |
| ✅ | Dart | Lint / Analyze | [analysis_options.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/analysis_options.yaml) |
| ✅ | Android | Kotlin version | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/android/build.gradle#L2) |
| ✅ | Android | Apk attributes | build.gradle ([compileSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L30), [applicationId](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L43), [minSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L44), [targetSdkVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L45)) |
| ✅ | Android | Switching between Development and Production environment | [build.gradle](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/android/app/build.gradle#L50-L75), [Flavor dirs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/android/app/src), [signingConfigs](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/android/app/signingConfigs) |
| ✅ | iOS | Xcode version | [compatibilityVersion](https://github.com/wasabeef/flutter-architecture-blueprints/blob/3ae7135cc040fecf5bbb2100a353f6594037752d/ios/Runner.xcodeproj/project.pbxproj#L182) |
| ✅ | iOS | Podfile | [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/ios/Podfile) |
| ✅ | iOS | Switching between Development and Production environment | [xcconfig](https://github.com/wasabeef/flutter-architecture-blueprints/tree/master/ios/Config), [Podfile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/ios/Podfile#L7-L12) |

#### Architecture

|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Base | Using [Riverpod](https://pub.dev/packages/riverpod) + [Hooks](https://pub.dev/packages/flutter_hooks) + [ChangeNotifier](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#changenotifier) + MVVM | [home_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/ui/home/home_page.dart#L15-L21), [home_view_model.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/ui/home/home_view_model.dart), [news_repository.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/data/repository/news_repository.dart), [news_data_source.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/data/remote/news_data_source.dart) |
| ✅ | Networking | Using [dio](https://pub.dev/packages/dio) | [app_dio.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/data/remote/app_dio.dart), [news_data_source_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/data/remote/news_data_source_impl.dart#L16-L33) |
| ✅ | Caching | Using [dio_http_cache](https://pub.dev/packages/dio_http_cache)  | [news_data_source_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/data/remote/news_data_source_impl.dart#L31) |
| ✅ | Persist Data | Using [shared_preferences](https://pub.dev/packages/shared_preferences) | [theme_data_source_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/data/local/theme_data_source_impl.dart) |
| ✅ | Constants | Define constants and route names | [constants.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/constants.dart) |
| ✅ | Localization | Switching between two languages | [message.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/l10n/message.dart#L13-L21), [context.localized](https://github.com/wasabeef/flutter-architecture-blueprints/blob/b93557b5fe790d8e386136a820d9b0713c2e7950/lib/view/MyHomePage.dart#L24) |
| 🤔 | Error handling | Using [ChangeNotifier](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#changenotifier) | [change_notifier_with_error_handle.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/ui/change_notifier_with_error_handle.dart), [error_notifier.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/ui/error_notifier.dart), [home_view_model.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/home/home_view_model.dart#L26-L30) |

#### UI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Theme | Dynamically Switch between light and dark themes | [app_theme.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/lib/ui/app_theme.dart), [app.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/app.dart#L22-L23) |
| ✅ | Font | Using [Google font](https://pub.dev/packages/google_fonts) | [app_theme.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/app_theme.dart#L16) |
| ✅ | Transition | Simple animation between screens using [Hero](https://flutter.dev/docs/development/ui/animations/hero-animations) | [article_item.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/component/article_item.dart#L28), [detail_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/detail/datail_page.dart#L13-L24) |

#### Testing
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | API(Repositories) | If needed, we'll use [Mockito](https://pub.dev/packages/mockito) | [view_mode_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/test/ui/view_mode_test.dart), [app_theme_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/test/ui/app_theme_test.dart) |
| ☑️ | UI | If needed, we'll use [Mockito](https://pub.dev/packages/mockito) | [widget_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/test/ui/widget_test.dart) |
| ✅ | Coverage reports | Send the report to [Codecov](https://codecov.io/) on CI |[codecov.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/codecov.yml), [codecov.sh](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/scripts/codecov.sh), [flutte-ci.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/8e2a373af5e4603aaa75d3c9b9af8150400ab46e/.github/workflows/flutter-ci.yml#L66-L71) |

#### CI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/package.json#L4-L11), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/.gitignore) |
| ✅ | Build | Using [Codemagic](https://codemagic.io/) |[codemagic.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/codemagic.yaml)|
| ✅ | Build | Using [Bitrise](https://www.bitrise.io/) |[bitrise.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/bitrise.yml)|
| ✅ | Build | Using [Github Actions](https://github.com/features/actions) | [.github/workflows/flutter-ci.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/master/.github/workflows/flutter-ci.yml) |

## Getting Started

<img height="560px" src="./art/running-app.gif" align="left" />

### Setup

```shell script
$ make setup
$ make build-runner
```

### Make .apk and .ipa file

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
