#!/usr/bin/bash

# absolute path of working directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$DOTFILES/home" || exit
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
mkdir -p "$scripts_path"
stow --verbose --target="$scripts_path" toolbox
