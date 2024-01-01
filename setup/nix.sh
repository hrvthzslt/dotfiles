#!/bin/bash

if ! command -v curl &>/dev/null; then
  echo "curl could not be found"
  exit 1
fi

export NIXPKGS_ALLOW_UNFREE=1

install_packages() {
  for package in "$@"; do
    nix-env -iA nixpkgs."$package"
  done
}

install_nix() {
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  # shellcheck disable=1091
  . "$HOME"/.nix-profile/etc/profile.d/nix.sh
}

main() {
  install_nix

  # Utilities
  install_packages fzf ripgrep eza fd sd entr act gtop imagemagick translate-shell

  # Dev tools
  install_packages act hurl lazydocker lazygit tmux gnumake

  # Workflow
  install_packages tmuxinator neovim stow gh

  # Makeup
  install_packages starship dwt1-shell-color-scripts

  # Help tools
  install_packages ddgr w3m links2 cht-sh tldr

  # Database
  install_packages mysql mycli redis iredis

  # Dev languages
  install_packages gccgo go php82 php82Packages.composer nodejs pipx

  # Clean up garbage
  nix-store --gc

  # Post install
  gh extension install github/gh-copilot --force
}

main

exit 0;
