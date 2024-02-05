#!/bin/bash

if ! command -v curl >/dev/null; then
  echo "curl could not be found"
  exit 1
fi

main() {

  # Clean up garbage
  nix-store --gc
}

main

exit 0
