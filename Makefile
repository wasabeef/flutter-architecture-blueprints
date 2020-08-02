
.PHONY: setup
setup:
	flutter channel beta
	flutter upgrade
	flutter pub get
	npm install

.PHONY: pre-push
pre-push:
	flutter format lib/
	flutter analyze

.PHONY: build-dev-apk
build-dev-apk:
	flutter build apk --release --flavor development --target lib/main_dev.dart

.PHONY: build-prd-apk
build-prd-apk:
	flutter build apk --release --flavor production --target lib/main_prd.dart
