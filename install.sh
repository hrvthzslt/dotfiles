#!/usr/bin/bash

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Source nix
# shellcheck disable=1091
. "$HOME"/.nix-profile/etc/profile.d/nix.sh

# install packages
./setup/nix.sh

# symlink config and scripts
./setup/link.sh

# install keyd
./setup/keyd.sh

# install kitty
./setup/kitty.sh
