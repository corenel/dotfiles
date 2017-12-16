#!/usr/bin/env bash

# install hammerspoon
git clone https://github.com/ashfinal/awesome-hammerspoon.git ~/.hammerspoon
cp ~/.hammerspoon/config-example.lua ~/.hammerspoon/private/config.lua

# install python packages
python3 -m pip install --upgrade pip
python3 -m pip install -r $HOME/.postinstall/scripts/requirements.txt
mkdir -p $HOME/.virtualenvs

# apply zshrc
source $HOME/.zshrc

