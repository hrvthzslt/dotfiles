#!/usr/bin/bash

# absolute path of working directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# remove config files
for file in $(find home | sed "s/[^/]*\/[^/]*\///" | grep -v "^home" | grep -v "\.config$"); do
  path="$HOME"/"$file"
  rm -rf "$path"
done
cd home || exit
# link config files
for config in *; do
  stow --verbose --target="$HOME" "$config"
done
cd "$DOTFILES" || exit

# link keyd
sudo rm -rf /etc/keyd/default.conf
echo "Symlinking keyd config file..."
sudo ln -s "$DOTFILES"/keyd/default.conf /etc/keyd/default.conf

# link scripts
scripts_path="$HOME"/.local/bin/toolbox/
rm -rf "$scripts_path"
mkdir -p "$scripts_path"
stow --verbose --target="$scripts_path" toolbox
