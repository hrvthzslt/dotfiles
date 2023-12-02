#!/bin/sh

export NIXPKGS_ALLOW_UNFREE=1

nia() {
  for package in "$@"; do
    nix-env -iA nixpkgs."$package"
  done
}

# Utilities
nia fzf ripgrep eza fd sd entr act gtop imagemagick translate-shell

# Dev tools
nia act hurl lazydocker lazygit

# Workflow
nia tmuxinator neovim starship

# Makeup
nia starship dwt1-shell-color-scripts

# Interweb
nia ddgr w3m links2

# Database
nia mysql mycli redis iredis nodePackages.sql-formatter

# C
nia gccgo

# Shell
nia shellcheck shfmt nodePackages.bash-language-server

# Go
nia go gopls

# PHP
nia php82 php82Packages.php-cs-fixer php82Packages.phpstan phpactor nodePackages.intelephense

# Javascript
nia nodejs nodePackages.volar eslint_d prettierd

# Python
nia python311Packages.jedi-language-server python311Packages.autopep8

# Markdown
nia marksman

# Lua
nia lua-language-server

# Docker
nia dockerfile-language-server-nodejs

# Clean up garbage
nix-store --gc
