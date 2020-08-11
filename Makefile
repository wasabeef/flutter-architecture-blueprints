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

.PHONY: format-analyze
format-analyze:
	flutter format lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: build-dev-apk
build-dev-apk:
	flutter build apk --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-prd-apk
build-prd-apk:
	flutter build apk --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-dev-ipa
build-dev-ipa:
	cd ios/ && pod install && cd ..
	flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-prd-ipa
build-prd-ipa:
	cd ios/ && pod install && cd ..
	flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: unit-test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

