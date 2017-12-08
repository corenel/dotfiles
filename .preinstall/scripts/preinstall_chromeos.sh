# install chromebrew
curl -Ls git.io/vddgY -o install.sh && yes | bash install.sh
crew install buildessential zsh tmux wget htop python3 fasd neovim

# install crouton
curl -Ls https://goo.gl/fd3zc -o ~/Downloads/crouton && yes | \
  sudo sh ~/Downloads/crouton -t xfce \
  sudo sh ~/Downloads/crouton -n xenial -u -t xiwi
