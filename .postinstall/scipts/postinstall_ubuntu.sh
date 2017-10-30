#!/usr/bin/env bash

# install python packages
pip3 install --upgrade pip
pip3 install -r requirements.txt
mkdir -p .virtualenvs

# apply zshrc
source $HOME/.zshrc
