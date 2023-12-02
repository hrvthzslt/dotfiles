#!/bin/sh

nix-env -iA nixpkgs.fzf\
    nixpkgs.ripgrep\
    nixpkgs.eza\
    nixpkgs.fd\
    nixpkgs.sd\
    nixpkgs.bat\
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
    nixpkgs.gopls\
    nixpkgs.shellcheck\
    nixpkgs.shfmt\
    nixpkgs.nodePackages.bash-language-server\
    nixpkgs.lua-language-server\
    nixpkgs.python311Packages.jedi-language-server\
    nixpkgs.python311Packages.autopep8\
    nixpkgs.nodePackages.volar\
    nixpkgs.eslint_d\
    nixpkgs.prettierd\
    nixpkgs.dockerfile-language-server-nodejs\
    nixpkgs.nodePackages.sql-formatter

nix-store --gc
