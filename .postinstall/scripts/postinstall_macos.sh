#!/usr/bin/env bash

# install python packages
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
mkdir -p $HOME/.virtualenvs

# apply zshrc
source $HOME/.zshrc

