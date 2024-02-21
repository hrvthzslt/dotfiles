# export env variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/toolbox:$PATH"
export LOCALE_ARCHIVE="/lib/locale/locale-archive"
export EDITOR="nvim"
export COMPOSER_AUTH='{"github-oauth": {"github.com": "ghp_xxx"}}'
export CHTSH_CONF="$HOME/.config/cht.sh/cht.sh.conf"

if [ -z "$TMUX" ]; then
    ta;
fi

# add to path
pathprepend() {
  for arg in "$@"; do
    export PATH="$1:$PATH"
  done
}

pathprepend \
  "$HOME/.local/share/nvim/mason/bin" \
  "$HOME/.local/bin/npm_packages/bin" \
  "$HOME/.local/bin/toolbox" \
  "$HOME/.local/bin" \
  "$HOME/.nix-profile/bin"

export pathprepend

# key bindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Fix to ctrl+r in tmux
bindkey '^R' history-incremental-search-backward
# Added ctrl+p for good measure, since that was also broken
bindkey '^P' up-history
bindkey '^N' down-history

# preserve history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

# start ssh-agent
eval "$(ssh-agent -s)" > /dev/null

# read aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# read optional aliases
if [ -f ~/.local_aliases ]; then
    . ~/.local_aliases
fi

# Plugin manager
[[ -r ~/workspace/third-party/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/workspace/third-party/znap
source ~/workspace/third-party/znap/znap.zsh

znap source marlonrichert/zsh-autocomplete
znap source joshskidmore/zsh-fzf-history-search

# starhip
eval "$(starship init zsh)"
