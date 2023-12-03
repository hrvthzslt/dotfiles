#!/bin/sh

export NIXPKGS_ALLOW_UNFREE=1

packages=""

collect() {
  for package in "$@"; do
      if [ -z "$packages" ]; then
        packages="nixpkgs.$package"
    else
        packages="$packages nixpkgs.$package"
      fi
  done
}

# Utilities
collect fzf ripgrep eza fd sd entr act gtop imagemagick translate-shell

# Dev tools
collect act hurl lazydocker lazygit

# Workflow
collect tmuxinator neovim

# Github
collect gh github-copilot-cli

# Makeup
collect starship dwt1-shell-color-scripts

# Interweb
collect ddgr w3m links2

# Database
collect mysql mycli redis iredis nodePackages.sql-formatter

# C
collect gccgo

# Shell
collect shellcheck shfmt nodePackages.bash-language-server

# Go
collect go gopls

# PHP
collect php82 php82Packages.php-cs-fixer php82Packages.phpstan phpactor nodePackages.intelephense

# Javascript
collect nodejs nodePackages.volar eslint_d prettierd

# Python
collect python311Packages.jedi-language-server python311Packages.autopep8

# Markdown
collect marksman

# Lua
collect lua-language-server

# Docker
collect dockerfile-language-server-nodejs

# Install packages
echo nix-env -iA "$packages" | sh

# Clean up garbage
nix-store --gc
