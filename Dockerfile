# Use the openSUSE Tumbleweed base image
FROM opensuse/tumbleweed

# Install necessary packages
RUN zypper ref && zypper install -y \
    sudo \
    shadow \
    gcc \
    neovim \
    tmux \
    starship \
    git \
    find \
    fzf \
    ripgrep \
    lazygit \
    python3 \
    nodejs \
    npm \
    php \
    go \
    ansible \
    && zypper clean -a

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

# Symlink dotfiles
RUN mkdir -p /home/$HOST_USER/workspace/dotfiles
COPY . /home/$HOST_USER/workspace/dotfiles
RUN cd /home/$HOST_USER/workspace/dotfiles \
    && ansible-playbook main.yml --tags link --skip-tags keyd,desktop,github

WORKDIR /home/$HOST_USER/workspace/project

# Entry point
CMD ["/bin/bash"]
