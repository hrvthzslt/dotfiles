if [ -z "$TMUX" ]; then
    ta;
fi

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
    . ~/.aliases
fi

# read optional aliases
if [ -f ~/.local_aliases ]; then
    . ~/.local_aliases
fi

fzf_share=$(fzf-share)
. "$fzf_share/key-bindings.bash"
. "$fzf_share/completion.bash"

# starhip
eval "$(starship init bash)"

# splash screen
color
