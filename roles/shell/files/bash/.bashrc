case $- in
  *i*) ;; # interactive
  *) return ;;
esac

set -o vi

# export env variables
export EDITOR="nvim"
export COMPOSER_AUTH='{"github-oauth": {"github.com": "ghp_xxx"}}'
export CHTSH_CONF="$HOME/.config/cht.sh/cht.sh.conf"
export LOCALE_ARCHIVE="/lib/locale/locale-archive"
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

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
  "$HOME/.local/share/nvim/mason/bin" \
  "$HOME/.local/bin/toolbox" \
  "$HOME/.local/bin" \
  "/usr/local/go/bin" \

# start ssh-agent
eval "$(ssh-agent -s)" >/dev/null

# read aliases
if [ -f ~/.aliases ]; then
  # shellcheck disable=1090
  . ~/.aliases
fi

# read optional aliases
if [ -f ~/.local_aliases ]; then
  # shellcheck disable=1090
  . ~/.local_aliases
fi

fzf_share=$(fzf-share)
# shellcheck disable=1091
. "$fzf_share/key-bindings.bash"
# shellcheck disable=1091
. "$fzf_share/completion.bash"

# starhip
eval "$(starship init bash)"
