#!/bin/bash

if ! command -v curl >/dev/null; then
  echo "curl could not be found"
  exit 1
fi

export NIXPKGS_ALLOW_UNFREE=1

install_nix() {
  if [ "$(which nix)" ]; then
    echo "Nix is already installed"
    return 0
  fi

  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  # shellcheck disable=1091
  . "$HOME"/.nix-profile/etc/profile.d/nix.sh
}

install_packages() {
  for package in "$@"; do
    nix-env -iA nixpkgs."$package"
  done
}

post_install() {
  gh extension install github/gh-copilot --force
  gh extension install dlvhdr/gh-dash --force
}

main() {
  install_nix

  # Workflow
  install_packages neovim gh

  # Help tools
  install_packages cht-sh

  # Database
  install_packages mysql mycli redis iredis

  # Dev languages
  install_packages gccgo go php82 php82Packages.composer typescript nodejs pipx

  # Clean up garbage
  nix-store --gc

  # Post install
  post_install
}

main

exit 0
