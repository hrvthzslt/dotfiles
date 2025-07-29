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
  "$HOME"/.opencode/bin \
  "/usr/local/go/bin" \
  "$HOME/go/bin" \
  "$HOME/.local/share/nvim/mason/bin" \
  "$HOME/.local/bin/npm_packages/bin" \
  "$HOME/.local/bin/toolbox" \
  "$HOME/.local/bin" \
  "$HOME/.nix-profile/bin"

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

# shellcheck disable=1091
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fzf --bash)"

# starhip
eval "$(starship init bash)"
