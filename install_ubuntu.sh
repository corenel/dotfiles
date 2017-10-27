#!/usr/bin/env bash

# install essential packages
sudo cp ./ubuntu/sources.list /etc/apt/sources.list
sudo cp ./ubuntu/apt-fast.conf /etc/
sudo mkdir -p /etc/apt/sources.list.d
sudo add-apt-repository ppa:jonathonf/vim
sudo add-apt-repository ppa:saiarcot895/myppa
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get -y install apt-fast
sudo apt-fast install -y build-essential openssh-server git wget zsh htop vim python3-pip curl cmake autojump python-pip clang ccache pypy tmux polipo albert xclip

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# copy dotfiles
cp ./share/* $HOME/
for c in .config .vnc .poliporc proxyservise ss.json .zshrc.custom; do
  cp ./ubuntu/$c $HOME/
done

# install python packages
pip3 install --upgrade pip
pip3 install -r requirements.txt
mkdir -p .virtualenvs
# mkvirtualenv -p python3 py3.5

source $HOME/.zshrc

# install vncserver
# sudo apt-get install -y xfce4 xfce4-goodies tightvncserver
# vncserver -kill :1
# mv $HOME/.vnc/xstartup $HOME/.vnc/xstartup.bak
# cp dotfiles/.vnc/xstartup $HOME/.vnc/
# vncserver
