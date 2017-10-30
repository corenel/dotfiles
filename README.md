# dotfiles

My dotfiles for both macOS and Ubuntu. That config runs flawlessly on my workstations with macOS 10.12.6 and Ubuntu 16.04.3 LTS. 

## Usage

1. [WIP] look at `.preinstall` and make sure you install required packages.
  - Currently, those scripts haven't been re-arranged. Be careful before running them.
2. Run `install.sh` to create symbol links for dotfiles (some operations are just copying).
  - OS-specific custom dotfiles are in `.postinstall`, the script will automatically recognize OS type and do the post-installation. 

## Packages

- **Common**:
  - config for utils: zsh, tmux, tmuxp, git and vim
  - config for linter and formatter: clang, yapf
  - mirror for github, npm and pip

- **macOS**:
  - config for iTerm2
  - speficial zsh config for masOS

- **Ubuntu**:
  - config for terminator, tilix and albert
  - config for ss and polipo
