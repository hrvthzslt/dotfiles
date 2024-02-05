#!/bin/bash

if ! command -v curl >/dev/null; then
  echo "curl could not be found"
  exit 1
fi

export NIXPKGS_ALLOW_UNFREE=1

install_packages() {
  for package in "$@"; do
    nix-env -iA nixpkgs."$package"
  done
}

main() {
  # Help tools
  install_packages cht-sh

  # Database
  install_packages mysql mycli redis iredis

  # Dev languages
  install_packages gccgo go php82 php82Packages.composer typescript nodejs pipx

  # Clean up garbage
  nix-store --gc
}

main

exit 0
