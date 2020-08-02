
.PHONY: setup
setup:
	flutter channel beta
	flutter upgrade
	flutter pub get
	npm install