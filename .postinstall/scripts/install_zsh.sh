#!/usr/bin/env bash

version=5.4.2
filename=zsh-$version.tar.gz

if [[ ! -d filename ]]; then
    wget "http://www.zsh.org/pub/$filenamz"           &&
    tar -xvf $filename
fi

cd "zsh-$version"
./configure --prefix=/usr         \
            --bindir=/bin         \
            --sysconfdir=/etc/zsh \
            --enable-etcdir=/etc/zsh                  &&
sudo make -j$nproc                                    &&
sudo make install                                     &&
