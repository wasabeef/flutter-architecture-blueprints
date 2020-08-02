
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
