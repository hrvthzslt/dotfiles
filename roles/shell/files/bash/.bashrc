case $- in
  *i*) ;; # interactive
  *) return ;;
esac

set -o vi

# export env variables
export EDITOR="nvim"
export CHTSH_CONF="$HOME/.config/cht.sh/cht.sh.conf"
export LOCALE_ARCHIVE="/lib/locale/locale-archive"
export HISTCONTROL=ignoreboth
export HISTSIZE=
export HISTFILESIZE=
export LC_ALL="en_US.UTF-8"

# export path
pathremove() {
  PATH=${PATH//:"$1:"/:}
  PATH=${PATH/#"$1:"/}
  PATH=${PATH/%":$1"/}
}
export pathremove

pathprepend() {
  for arg in "$@"; do
    test -d "$arg" || continue
    pathremove "$arg"
    export PATH="$arg${PATH:+":${PATH}"}"
  done
}
export pathprepend

pathprepend \
  "/usr/local/go/bin" \
  "$HOME/go/bin" \
  "$HOME/.local/share/nvim/mason/bin" \
  "$HOME/.local/bin/npm_packages/bin" \
  "$HOME/.local/bin/toolbox" \
  "$HOME/.local/bin" \
  "$HOME/.nix-profile/bin"

export NODE_PATH="$HOME/.local/bin/npm_packages/lib/node_modules"

# start ssh-agent
eval "$(ssh-agent -s)" >/dev/null

# read aliases
if [ -f ~/.aliases ]; then
  # shellcheck disable=1090
  . ~/.aliases
fi

# read optional rc
if [ -f ~/.localrc ]; then
  # shellcheck disable=1090
  . ~/.localrc
fi

# source miniconda
[ -f /opt/conda/etc/profile.d/conda.sh ] && source /opt/conda/etc/profile.d/conda.sh

# shellcheck disable=1091
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

eval "$(fzf --bash)"

# starhip
eval "$(starship init bash)"
