#!/usr/bin/env bash

# install essential packages
sudo cp ./ubuntu/sources.list /etc/apt/sources.list
sudo add-apt-repository ppa:saiarcot895/myppa
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y --install-recommends linux-generic-hwe-16.04 xserver-xorg-hwe-16.04
sudo apt-get install -y --allow-unauthenticated build-essential openssh-server git wget htop curl \
  cmake autojump python-pip clang ccache pypy polipo albert xclip xsel zsh

# install linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bashrc
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >> ~/.bashrc
echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.bashrc
source ~/.bashrc
brew install python3
# brew install vim --with-client-server --with-python3 --without-python --with-overide-system-vi --with-lua
brew install neovim tmux axel
mkdir -p /home/yuthon/.local/lib/python2.7/site-packages
echo 'import site; site.addsitedir("/home/linuxbrew/.linuxbrew/lib/python2.7/site-packages")' >> /home/yuthon/.local/lib/python2.7/site-packages/homebrew.pth
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/berkeley-db@4/bin:$PATH"' >> ~/.bashrc

# install node packages 
npm install -g csslint prettier stylelint htmlhint eslint

# install nerd fonts
cd "$HOME/Downloads" || return
git clone https://github.com/ryanoasis/nerd-fonts.git
./install.sh

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

