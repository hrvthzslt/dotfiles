#!/usr/bin/env bash

# install zsh, set as default shell, abort if not succeeded
if [ ! "$(./setup/zsh.sh)" ]; then
    exit 1;
fi

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Source nix
# shellcheck disable=1091
. "$HOME"/.nix-profile/etc/profile.d/nix.sh

# install packages
./setup/nix.sh

# install keyd
./setup/keyd.sh

# install kitty
./setup/kitty.sh

# symlink config and scripts
./setup/link.sh
