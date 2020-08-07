
.PHONY: setup
setup:
	flutter channel beta
	flutter upgrade
	flutter pub get
	npm install

.PHONY: analyze
format-analyze:
	flutter analyze

.PHONY: format-analyze
format-analyze:
	flutter format lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build

.PHONY: build-dev-apk
build-dev-apk:
	flutter build apk --flavor development --target lib/main_dev.dart

.PHONY: build-prd-apk
build-prd-apk:
	flutter build apk --flavor production --target lib/main_prd.dart

.PHONY: build-dev-ipa
build-dev-ipa:
	cd ios/ && pod install && cd ..
	flutter build ios --release --no-codesign --flavor development --target lib/main_dev.dart

.PHONY: build-prd-ipa
build-prd-ipa:
	cd ios/ && pod install && cd ..
	flutter build ios --release --no-codesign --flavor production --target lib/main_prd.dart

.PHONY: unit-test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

