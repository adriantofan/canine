FLUTTER := $(shell which flutter)
DART := $(shell which dart)
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
APP_DIR := $(ROOT_DIR)
CANINE_SYNC_DIR := $(APP_DIR)/package/canine_sync
FORM_INPUTS_DIR := $(APP_DIR)/package/form_inputs

GENERATE_DART := $(DART) run build_runner build --delete-conflicting-outputs
PUB_GET := $(FLUTTER) pub get

.PHONY: install
install: COCOAPODS

.PHONY: COCOAPODS
COCOAPODS:
	brew install cocoapods

.PHONY: generate
generate: generate-app generate-canine-sync

.PHONY: generate-app
generate-app:
	cd $(APP_DIR) &&  $(GENERATE_DART)

.PHONY: generate-canine-sync
generate-canine-sync:
	cd $(CANINE_SYNC_DIR) &&  $(GENERATE_DART)

.PHONY: dependencies
dependencies: dependencies-app dependencies-canine-sync dependencies-form-inputs

.PHONY: dependencies-app
dependencies-app:
	cd $(APP_DIR) &&  $(PUB_GET)

.PHONY: dependencies-canine-sync
dependencies-canine-sync:
	cd $(CANINE_SYNC_DIR) &&  $(PUB_GET)

.PHONY: dependencies-form-inputs
dependencies-form-inputs:
	cd $(FORM_INPUTS_DIR) &&  $(PUB_GET)

.PHONY: dependencies-outdated
dependencies-outdated: dependencies-outdated-app dependencies-outdated-canine-sync dependencies-outdated-form-inputs

.PHONY: dependencies-outdated-app
dependencies-outdated-app:
	cd $(APP_DIR) &&  $(FLUTTER) pub outdated

.PHONY: dependencies-outdated-canine-sync
dependencies-outdated-canine-sync:
	cd $(CANINE_SYNC_DIR) &&  $(FLUTTER) pub outdated

.PHONY: dependencies-outdated-form-inputs
dependencies-outdated-form-inputs:
	cd $(FORM_INPUTS_DIR) &&  $(FLUTTER) pub outdated


