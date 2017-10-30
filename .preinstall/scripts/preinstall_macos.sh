#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew tap caskroom/cask
brew tap caskroom/fonts

# install packages
brew cask install xquartz font-source-code-pro font-source-code-pro-for-powerline font-fira-code font-meslo-for-powerline
brew install zsh xclip autojump python3 python pip-completion watch cppcheck wget nvm clang gcc htop
ffmpeg cmake tree ctags openssh clang-format m-cli graphviz ccat gpg ag ack fzf write-good
brew install vim --with-python3 --without-python

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

