#!/usr/bin/env bash

# install essential packages
sudo sed -i 's/cn.archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
# run 'sudo apt-get install -y software-properties-common' if add-apt-repository is not found
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:pi-rho/dev
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y --install-recommends \
  linux-generic-hwe-16.04 xserver-xorg-hwe-16.04
sudo apt-get install -y --allow-unauthenticated build-essential \
  openssh-server git wget htop curl cmake autojump clang ccache \
  pypy polipo xclip xsel zsh tmux-next neovim\
  python-dev python-pip python3-dev python3-pip python3.6 python3.6-dev

# install linuxbrew
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
# test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
# test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
# test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bashrc
# echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >> ~/.bashrc
# echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.bashrc
# source ~/.bashrc
# brew install neovim tmux axel
# brew install python3
# brew install vim --with-client-server --with-python3 --without-python --with-overide-system-vi --with-lua
# mkdir -p /home/yuthon/.local/lib/python2.7/site-packages
# echo 'import site; site.addsitedir("/home/linuxbrew/.linuxbrew/lib/python2.7/site-packages")' >> /home/yuthon/.local/lib/python2.7/site-packages/homebrew.pth
# echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/berkeley-db@4/bin:$PATH"' >> ~/.bashrc

# install node packages 
# npm install -g csslint prettier stylelint htmlhint eslint

# install nerd fonts
cd "$HOME/Downloads" || return
git clone https://github.com/ryanoasis/nerd-fonts.git
./install.sh

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

