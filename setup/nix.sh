#!/bin/sh

export NIXPKGS_ALLOW_UNFREE=1

install_packages() {
  for package in "$@"; do
    nix-env -iA nixpkgs."$package"
  done
}

# Utilities
install_packages fzf ripgrep eza fd sd entr act gtop imagemagick translate-shell

# Dev tools
install_packages act hurl lazydocker lazygit

# Workflow
install_packages tmuxinator neovim starship

# Makeup
install_packages starship dwt1-shell-color-scripts

# Interweb
install_packages ddgr w3m links2

# Database
install_packages mysql mycli redis iredis nodePackages.sql-formatter

# C
install_packages gccgo

# Shell
install_packages shellcheck shfmt nodePackages.bash-language-server

# Go
install_packages go gopls

# PHP
install_packages php82 php82Packages.php-cs-fixer php82Packages.phpstan phpactor nodePackages.intelephense

# Javascript
install_packages nodejs nodePackages.volar eslint_d prettierd

# Python
install_packages python311Packages.jedi-language-server python311Packages.autopep8

# Markdown
install_packages marksman

# Lua
install_packages lua-language-server

# Docker
install_packages dockerfile-language-server-nodejs

# Clean up garbage
nix-store --gc
