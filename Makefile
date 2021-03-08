.PHONY: setup-tools
setup-tools:
	dart pub global activate fvm
	fvm install
	fvm flutter pub get
	npm install

.PHONY: setup-env
setup-env:
	export PATH="$PATH:`pwd`/flutter/bin"
	export PATH="$PATH:`pwd`/bin/cache/dart-sdk/bin"
	export PATH="$PATH:`pwd`/.pub-cache/bin"

.PHONY: dependencies
dependencies:
	fvm flutter pub get

.PHONY: analyze
analyze:
	fvm flutter analyze

.PHONY: format 
format:
	fvm flutter format lib/

.PHONY: format-analyze
format-analyze:
	fvm flutter format --dry-run lib/
	fvm flutter analyze

.PHONY: build-runner
build-runner:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run-dev
run-dev:
	fvm flutter run --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: run-prd
run-prd:
	fvm flutter run --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-dev
build-android-dev:
	fvm flutter build apk --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-android-prd
build-android-prd:
	fvm flutter build apk --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev:
	fvm flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-ios-prd
build-ios-prd:
	fvm flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: unit-test
unit-test:
	fvm flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

