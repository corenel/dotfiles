#!/usr/bin/env bash

# install hammerspoon
ln -sf "$HOME/.postinstall/macos/.hammerspoon" "$HOME/.hammerspoon"

# install python packages
python3 -m pip install --upgrade pip
python3 -m pip install -r $HOME/.postinstall/scripts/requirements.txt
mkdir -p $HOME/.virtualenvs

# apply zshrc
source $HOME/.zshrc

