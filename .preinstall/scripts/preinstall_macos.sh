#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# use mirror repo for HomeBrew
cd "$(brew --repo)" || return
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile

# tap
brew tap homebrew/science
brew tap caskroom/cask
brew tap caskroom/fonts

# install packages
brew cask install \
  google-chrome google-backup-and-sync sublime-text calibre docker dropbox etcher \
  hammerspoon iina karabiner-elements kext-utility skim \
  vlc vlcstreamer real-vnc vnc-viewer wewechat xld intel-power-gadget \
  android-file-transfer typora aria2gui iterm2 xquartz maciasl mounty \
  xamarin-jdk android-sdk \
# mactex surge clover-configurator\
brew cask install \
  font-source-code-pro \
  font-sourcecodepro-nerd-font font-sourcecodepro-nerd-font-mono \
  font-fira-code font-firacode-nerd-font font-firamono-nerd-font \
  font-meslo-for-powerline font-meslo-nerd-font font-meslo-nerd-font-mono \
  font-hack-nerd-font \

brew install zsh autojump tmux\
  python3 python pip-completion \
  watch cppcheck wget nvm gcc \
  htop reattach-to-user-namespace \
  ffmpeg cmake tree openssh \
  clang-format m-cli graphviz ccat \
  gpg ag ack fzf hadolint tldr
/usr/local/opt/fzf/install
#brew install vim --with-python3 --without-python
brew install neovim
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# install node packages 
#npm install -g csslint prettier stylelint htmlhint eslint

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

