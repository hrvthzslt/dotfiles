# export env variables
export LOCALE_ARCHIVE="/lib/locale/locale-archive"
export EDITOR="nvim"
export CHTSH_CONF="$HOME/.config/cht.sh/cht.sh.conf"

typeset -U path

# add to path
pathprepend() {
  for arg in "$@"; do
    test -d "$arg" || continue
    path+="$arg"
  done
}

pathprepend \
  "$HOME"/.opencode/bin \
  "/usr/local/go/bin" \
  "$HOME/go/bin" \
  "$HOME/.local/share/nvim/mason/bin" \
  "$HOME/.local/bin/npm_packages/bin" \
  "$HOME/.local/bin/toolbox" \
  "$HOME/.local/bin" \
  "$HOME/.nix-profile/bin"

export pathprepend
export PATH

# key bindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Fix to ctrl+r in tmux
bindkey '^R' history-incremental-search-backward
# Added ctrl+p for good measure, since that was also broken
bindkey '^P' up-history
bindkey '^N' down-history
# vi mode
bindkey -v

# preserve history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_DUPS
setopt appendhistory

# start ssh-agent
eval "$(ssh-agent -s)" > /dev/null

# shellcheck disable=1091
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

# read aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# read optional rc
if [ -f ~/.localrc ]; then
    . ~/.localrc
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf shell integration
source <(fzf --zsh)

# starhip
eval "$(starship init zsh)"
