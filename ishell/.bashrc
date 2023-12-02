set -o vi

# export env variables
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export COMPOSER_AUTH='{"github-oauth": {"github.com": "ghp_xxx"}}'
export CHTSH_CONF="$HOME/.config/cht.sh/cht.sh.conf"
export HISTFILESIZE=10000

# start ssh-agent
eval "$(ssh-agent -s)" > /dev/null

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

# splash screen
color
