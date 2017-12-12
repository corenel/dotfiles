#!/usr/bin/env bash

# install python packages
pip3 install --upgrade pip
pip3 install -r $HOME/.postinstall/scripts/requirements.txt
mkdir -p $HOME/.virtualenvs

# apply zshrc
source $HOME/.zshrc
