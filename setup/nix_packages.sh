#!/bin/sh

nix-env -iA nixpkgs.fzf\
    nixpkgs.ripgrep\
    nixpkgs.eza\
    nixpkgs.fd\
    nixpkgs.sd\
    nixpkgs.entr\
    nixpkgs.act\
    nixpkgs.hurl\
    nixpkgs.gtop\
    nixpkgs.imagemagick\
    nixpkgs.translate-shell\
    nixpkgs.starship\
    nixpkgs.neovim\
    nixpkgs.tmuxinator\
    nixpkgs.ddgr\
    nixpkgs.w3m\
    nixpkgs.links2\
    nixpkgs.dwt1-shell-color-scripts\
    nixpkgs.gccgo\
    nixpkgs.lazydocker\
    nixpkgs.lazygit\
    nixpkgs.mycli\
    nixpkgs.redis\
    nixpkgs.mysql\
    nixpkgs.nodejs\
    nixpkgs.php82\
    nixpkgs.go\
    nixpkgs.gopls

nix-store --gc
