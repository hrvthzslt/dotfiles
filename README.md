# dotfiles

My $HOME my rules.
Collection of my **dotfiles** and **toolbox scripts** for my development environment. Installation and config management automated with **Ansible**, for **Debian** based distributions.

Sets up development environment for **Python/Conda**, **PHP**, **NodeJs**, **Go**, **Docker**. Installs CLI tools with **nix package manager**.

## Install

### Requirements

- python3
- ansible

### Install with make

Run the full installation:

```shell
make install
```

Run MacOS specific installation, which uses **brew**:

```shell
make macos
```

### Install with Ansible

Run all playbooks manually:

```shell
ansible-playbook --ask-become -i hosts main.yml
```

Or run selected playbooks:

```shell
ansible-playbook --ask-become -i hosts main.yml --tags utilities,toolbox
```

## Details (Deprecated)

[Replicate My Developer Environment Like an Almost Modern Caveman](https://zsolthorvath.xyz/posts/replicate-my-developer-environment-like-an-almost-modern-caveman/)

## TODO

Upgrade installation method of:

- [ ] nodejs
- [ ] docker
