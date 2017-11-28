#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew tap caskroom/cask
brew tap caskroom/fonts

# install packages
brew cask install xquartz \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-sourcecodepro-nerd-font font-sourcecodepro-nerd-font-mono \
  font-fira-code font-firacode-nerd-font font-firamono-nerd-font \
  font-meslo-for-powerline font-meslo-nerd-font font-meslo-nerd-font-mono \
  font-hack-nerd-font \
  xamarin-jdk android-sdk

brew install zsh xclip autojump python3 python pip-completion watch cppcheck wget nvm clang gcc \
  htop reattach-to-user-namespace ffmpeg cmake tree ctags openssh clang-format m-cli graphviz ccat \
  gpg ag ack fzf write-good hadolint
brew install vim --with-python3 --without-python
brew install neovim

# install node packages 
npm install -g csslint prettier stylelint htmlhint eslint

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


