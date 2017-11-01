#!/usr/bin/env bash

# install python packages
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install -r $HOME/.postinstall/scripts/requirements.txt
mkdir -p $HOME/.virtualenvs

# apply zshrc
source $HOME/.zshrc
