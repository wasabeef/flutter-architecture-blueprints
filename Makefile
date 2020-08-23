.PHONY: setup
setup:
	flutter channel beta
	flutter upgrade
	flutter pub get
	npm install
	cd ios/ && pod install && cd ..

.PHONY: dependencies
dependencies:
	flutter pub get

.PHONY: analyze
analyze:
	flutter analyze

.PHONY: format 
format:
	flutter format lib/

.PHONY: format-analyze
format-analyze:
	flutter format --set-exit-if-changed --dry-run lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: extract-arb
extract-arb:
	flutter pub pub run intl_translation:extract_to_arb --suppress-last-modified --output-dir=l10n-arb lib/l10n/message.dart

.PHONY: gen-intl
gen-intl:
	flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/message.dart l10n-arb/intl_messages_*.arb

.PHONY: run-dev
run-dev:
	flutter run --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: run-prd
run-prd:
	flutter run --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-dev
build-android-dev:
	flutter build apk --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-android-prd
build-android-prd:
	flutter build apk --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev:
	cd ios/ && pod install && cd ..
	flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-ios-prd
build-ios-prd:
	cd ios/ && pod install && cd ..
	flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: unit-test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

