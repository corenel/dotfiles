# install chromebrew
curl -Ls git.io/vddgY -o install.sh && yes | bash install.sh
crew install buildessential zsh tmux wget htop python3 fasd neovim

# install crouton
curl -Ls https://goo.gl/fd3zc -o ~/Downloads/crouton && yes | \
  sudo sh ~/Downloads/crouton -t xfce \
  sudo sh ~/Downloads/crouton -n xenial -u -t xiwi

# install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - --no-check-certificate)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

