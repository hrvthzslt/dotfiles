# dotfiles

My $HOME my rules.
Collection of my dotfiles and toolbox scripts for my development environment.

## Install
### Requirements

- python3
- ansible

### Install with script
Run the script called `install.sh`. It will install the required packages and set up the environment.

### Install with ansible

Or run all playbooks manually:

```shell
ansible-playbook --ask-become -i hosts main.yml
```

Or run selected playbooks:

```shell
ansible-playbook --ask-become -i hosts main.yml --tags utilities,toolbox
```

## Details (Deprecated)

[Replicate My Developer Environment Like an Almost Modern Caveman](https://zsolthorvath.xyz/posts/replicate-my-developer-environment-like-an-almost-modern-caveman/)
