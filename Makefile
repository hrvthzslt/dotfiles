.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: # Install tools and set up configuration
	scripts/setup-ansible
	ansible-playbook main.yml --ask-become

.PHONY: macos
macos: # Setup with brew for macOS
	scripts/macos
