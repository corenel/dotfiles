#!/usr/bin/env bash

{ # This ensures the entire script is downloaded.

set -e

#################
#  DEFINITIONS  #
#################

BASEDIR=$HOME/.dotfiles
REPOURL=https://github.com/corenel/dotfiles.git

###############
#  FUNCTIONS  #
###############

symlink() {
  src=$1
  dst=$2

  if [ -e $dst ]; then
    if [ -L $dst ]; then
      # Already symlinked -- I'll assume correctly.
      return
    else
      # Rename files with a ".old" extension.
      echo "$dst already exists, renaming to $dst.old"
      backup=$dst.old
      if [ -e $backup ]; then
        echo "Error: $backup already exists. Please delete or rename it."
        exit 1
      fi
      mv -v $dst $backup
    fi
  fi
  ln -sf $src $dst
}

check_os() {
  while true; do
    echo -e >&2 "Installing dotfiles for:\n\t[0] macOS\n\t[1] Ubuntu\n\t[2] ChromeOS"
    read -r -p "(Choose 0, 1 or 2):" opt
    case $opt in
      0)
        echo "macos"
        break
        ;;
      1)
        echo "ubuntu"
        break
        ;;
      2)
        echo "chromeos"
        break
        ;;
      *)
        echo >&2 "Please choose 0, 1 or 2"
        ;;
    esac
  done
}

check_git() {
  if ! which git >/dev/null ; then
    echo "Error: git is not installed"
    exit 1
  fi
}

check_repo() {
  # clone or update git repo
  if [ -d $BASEDIR/.git ]; then
    echo "Updating dotfiles using existing git..."
    cd $BASEDIR
    git pull --quiet --rebase origin master
    git submodule update --init --recursive --remote
  else
    echo "Checking out dotfiles using git..."
    rm -rf $BASEDIR
    git clone --quiet --depth=1 $REPOURL $BASEDIR
    git submodule update --init --recursive --remote
  fi
}

link_dotfiles() {
  # create symbol links from $basedir to $HOME
  cd $BASEDIR
  echo "Creating symlinks..."
  for path in .* ; do
    case $path in
      .|..|.git|.gitignore|.gitignore.example|.gitconfig.example|.ysvim)
        continue
        ;;
      *)
        symlink $BASEDIR/$path $HOME/$path
        ;;
    esac
  done

  # init global gitconfig and gitignore
  cp -v .gitconfig.example "$HOME/.gitconfig"
  cp -v .gitignore.example "$HOME/.gitignore"
}


install_ysvim() {
  cd $BASEDIR/.ysvim
  ./install.sh
}

install_orig_vim() {
  symlink $BASEDIR/.vim/vimrc $HOME/.vimrc
  echo "Setting up vim plugins..."
  mkdir -p $HOME/.vim/files/info
  $HOME/.vim/update.sh
}

post_install() {
  # post-install for specific os
  postinstall=BASEDIR/.postinstall/$1
  cd $postinstall
  # symlink os custom
  for path in .* ; do
    case $path in
      .|..)
        continue
        ;;
      .config)
        echo "rsync .config"
        rsync -rtv "$postinstall/$path/" "$HOME/.config"
        ;;
      *)
        symlink "$postinstall/$path" "$HOME/$path"
        ;;
    esac
  done

  # execute post-install script
  "$postinstall/scripts/postinstall_$oscustom.sh"
}

#################
#  MAIN SCRIPT  #
#################

OSCUSTOM=$(check_os)
check_git
check_repo
link_dotfiles
install_ysvim
postinstall $OSCUSTOM

} # This ensures the entire script is downloaded.
