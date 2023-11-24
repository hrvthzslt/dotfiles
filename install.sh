#!/usr/bin/env bash

# set zsh as default shell
if command -v zsh > /dev/null 2>&1; then
    sudo chsh -s "$(command -v zsh)" "${USER}"
else
    echo "Please install zsh and start again!"
    exit
fi

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Source nix
# shellcheck disable=1091
. "$HOME"/.nix-profile/etc/profile.d/nix.sh

# install packages
./setup/nix_packages.sh

# keyd
./setup/install_keyd.sh

# symlink config
./setup/link_config.sh
