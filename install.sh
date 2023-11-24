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
./nix_packages.sh

# keyd
git clone https://github.com/rvaiya/keyd keyd_repo
cd keyd_repo || exit 1
git checkout v2.4.3
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
cd .. || exit 1
rm -rf keyd_repo

# symlink config
./link_config.sh
