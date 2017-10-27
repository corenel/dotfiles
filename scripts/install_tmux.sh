# uninstall installed tmux
sudo apt-get remove tmux
sudo apt-get remove 'libevent-*'

# download tmux 2.6
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar xvzf tmux-2.6.tar.gz

# install libevent
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure && make
sudo make install
cd ..

# install libncurses
sudo apt-get install libncurses5-dev

# build tmux and install
cd tmux-2.6
./configure && make
sudo make install
