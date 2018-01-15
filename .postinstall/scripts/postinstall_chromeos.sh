#!/usr/bin/env bash

# install python packages
pip3 install --upgrade pip
pip3 install -r $HOME/.postinstall/scripts/requirements.txt
mkdir -p $HOME/.virtualenvs

# install texlive
crew install texlive
tlmgr option repository https://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
tlmgr update --self
tlmgr update --all
tlmgr install latexmk xetex beamer l3packages l3kernel fontspec \ 
  mathtools tex4ht doublestroke \
  ctex xecjk fandol \
  multirow caption subfig booktabs enumitem 

# setup custom fonts
# https://bugs.chromium.org/p/chromium/issues/detail?id=320364
mkdir -p /usr/local/share/fonts/

# apply zshrc
source $HOME/.zshrc
