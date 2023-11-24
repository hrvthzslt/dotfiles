#!/usr/bin/env bash

# absolute path of working directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# link zshrc and aliases
rm -rf "$HOME"/.zshrc
ln -s "$DOTFILES"/zsh/.zshrc "$HOME"/.zshrc
rm -rf "$HOME"/.aliases
ln -s "$DOTFILES"/zsh/.aliases "$HOME"/.aliases

# link startship
rm -rf "$HOME"/.config/starship.toml
ln -s "$DOTFILES"/starship/starship.toml "$HOME"/.config/starship.toml

# link keyd
sudo rm -rf /etc/keyd/default.conf
sudo ln -s "$DOTFILES"/keyd/default.conf /etc/keyd/default.conf

# link in .config folders
link_config() {
    rm -rf "$HOME"/.config/"$1"
    ln -s "$DOTFILES"/"$1" "$HOME"/.config/"$1"
}

for item in kitty tmux nvim cht.sh; do
    link_config "$item"
done

# link scripts
mkdir -p "$HOME"/.local/bin

link_script() {
    rm -rf "$HOME"/.local/bin/"$1"
    ln -s "$DOTFILES"/scripts/"$1" "$HOME"/.local/bin/"$1"
}

for script in scripts/*; do
    link_script "$(echo "$script" | cut -d'/' -f2)"
done
