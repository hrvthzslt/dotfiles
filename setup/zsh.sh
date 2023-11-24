#!/bin/sh

if [ "$(which zsh)" ]; then
    echo "zsh is already installed"
elif [ "$(which apt)" ]; then
    sudo apt install zsh #On Debian, Ubuntu, Pop!_OS, or Linux Mint
elif [ "$(which dnf)" ]; then
    sudo dnf install zsh #On Fedora, AlmaLinux, RHEL, or Rocky Linux
elif [ "$(which pacman)" ]; then
    sudo pacman -S zsh #On Arch, Manjaro, or EndeavourOS
fi

if command -v zsh > /dev/null 2>&1; then
    sudo chsh -s "$(command -v zsh)" "${USER}"
else
    echo "Please install zsh manually and start again!"
    exit 1
fi
