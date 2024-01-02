#!/usr/bin/bash

# absolute path of working directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# remove config files
cd home || exit
for file in $(find . | sed "s/[^/]*\/[^/]*\///" | grep -v "^home"); do
    path="$HOME"/"$file"
    rm -rf "$path"
done
# link config files
for config in *; do
  stow --adopt --target="$HOME" "$config"
done
cd "$DOTFILES" || exit

# link keyd
sudo rm -rf /etc/keyd/default.conf
sudo ln -s "$DOTFILES"/keyd/default.conf /etc/keyd/default.conf

# link scripts
scripts_path="$HOME"/.local/bin/toolbox/
rm -rf "$scripts_path"
mkdir -p "$scripts_path"
stow --target="$scripts_path" toolbox
