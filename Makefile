# Defining variables for all scripts
SCRIPTS_DIR := scripts
CODEGEN_SCRIPT := $(SCRIPTS_DIR)/build.sh
GIT_HOOKS_INIT := $(SCRIPTS_DIR)/git_hooks_init.sh
PODS := $(SCRIPTS_DIR)/update_pods.sh
GEN_L10N := $(SCRIPTS_DIR)/gen_l10n.sh
TEST_COVERAGE := $(SCRIPTS_DIR)/test_coverage.sh

# Tasks to run each script
gen:
	sh $(CODEGEN_SCRIPT)
	
hooks_init:
	sh $(GIT_HOOKS_INIT)

l10n:
	sh ${GEN_L10N}

pods:
	sh ${PODS}
	
fmt:
	fvm dart format -l 120 .
	
get: 
	fvm flutter clean; fvm flutter pub get
	
test_coverage:
	sh ${TEST_COVERAGE}
	
help:
	@echo "Available tasks:"
	@echo " - codegen: build_runner build & dart format 80"
	@echo " - hooks_init: init git hooks"
	@echo " - l10n: generates l10n code"
	@echo " - pods: updates pods"
	@echo " - fmt: formats the code with dart format"
	@echo " - get: cleans and gets dependencies"
	@echo " - test_coverage: runs tests with coverage"
