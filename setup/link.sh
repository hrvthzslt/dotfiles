#!/usr/bin/bash

# absolute path of working directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd home || exit
rm .bashrc 2> /dev/null
rm .zshrc 2> /dev/null
for config in *; do
    stow --adopt --target="$HOME" "$config"
done
cd "$DOTFILES" || exit

# link keyd
sudo rm -rf /etc/keyd/default.conf
sudo ln -s "$DOTFILES"/keyd/default.conf /etc/keyd/default.conf

# link scripts
scripts_path="$HOME"/.local/bin/toolbox/
mkdir -p "$scripts_path"
stow --target="$scripts_path" toolbox
