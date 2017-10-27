#!/usr/bin/env bash

# restore dotfiles
cp dotfiles/* $HOME/

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew tap caskroom/cask
brew tap caskroom/fonts

# install packages
brew cask install xquartz font-source-code-pro font-source-code-pro-for-powerline font-fira-code font-meslo-for-powerline
brew install xclip autojump python3 python pip-completion watch cppcheck wget nvm clang gcc htop ffmpeg cmake tree ctags openssh clang-format m-cli graphviz ccat gpg
