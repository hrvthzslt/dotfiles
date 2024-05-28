# Use the openSUSE Tumbleweed base image
FROM opensuse/tumbleweed

# Install necessary packages
RUN zypper ref && zypper install -y \
    sudo \
    shadow \
    openssh-clients \
    gcc \
    make \
    neovim \
    tmux \
    nodejs \
    npm \
    python3 \
    python3-pipx \
    lua-language-server \
    ShellCheck \
    shfmt \
    php \
    php-dom \
    php-tokenizer \
    php-xmlwriter \
    php-composer2 \
    php-cs-fixer \
    go \
    gopls \
    StyLua \
    starship \
    git \
    find \
    fzf \
    ripgrep \
    lazygit \
    && zypper clean -a

RUN npm i -g bash-language-server \
    intelephense \
    dockerfile-language-server-nodejs \
    typescript \
    typescript-language-server \
    @fsouza/prettierd \
    sql-formatter

# Set environment variables for UID and GID (these will be passed at build time)
ARG HOST_USER
ARG HOST_UID
ARG HOST_GID

# Create a group with the same GID
RUN groupadd -g $HOST_GID $HOST_USER

# Create a user with the same UID and add to the group
RUN useradd -u $HOST_UID -g $HOST_GID -m $HOST_USER

# Allow the new user to use sudo
RUN echo "$HOST_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the user for subsequent instructions
USER $HOST_USER

# Pipx
RUN pipx ensurepath
RUN pipx install ruff ruff-lsp python-lsp-server black isort

# Tmux
RUN sudo mkdir /run/tmux
RUN sudo chown -R $HOST_UID:$HOST_GID /run/tmux

# Neovim
COPY --chown=$HOST_USER:$HOST_USER roles/neovim/files/nvim/ /home/$HOST_USER/.config/nvim/
RUN nvim --headless -c 'Lazy restore' +qa
RUN nvim --headless +'TSUninstall all' +qa
RUN nvim --headless +'TSInstall bash python dockerfile javascript typescript php go go json html toml lua markdown query sql vim vimdoc vue yaml git_config git_rebase gitattributes gitcommit gitignore' +'sleep 15' +qa

# Set the working directory
WORKDIR /home/$HOST_USER/workspace

# Entry point
CMD ["/bin/bash"]
