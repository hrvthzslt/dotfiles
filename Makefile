.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: # Install tools and set up configuration
	scripts/setup-ansible
	ansible-playbook main.yml --ask-become --skip-tags wayland

.PHONY: macos
macos: # Setup with brew for macOS
	scripts/macos

lint: # Run shellcheck on scripts and syntax check playbook
	shellcheck roles/toolbox/files/toolbox/*
	ansible-playbook --syntax-check main.yml

pre-commit-hook: # Add pre-commit hook running shellcheck on scripts
	@echo '#!/bin/sh' > .git/hooks/pre-commit
	@echo 'make lint' >> .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
