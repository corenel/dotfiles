#!/usr/bin/env bash

{ # This ensures the entire script is downloaded.

set -e

# define constant
basedir=$HOME/.dotfiles
repourl=git://github.com/corenel/dotfiles.git

function copy() {
  src=$1
  dest=$2

  if [ -e $dest ]; then
    # Already exists -- I'll assume correctly.
    return
  else
    # Rename files with a ".old" extension.
    echo "$dest already exists, renaming to $dest.old"
    backup=$dest.old
    if [ -e $backup ]; then
      echo "Error: $backup already exists. Please delete or rename it."
      exit 1
    fi
    mv -v $dest $backup
  fi
  cp -fr $src $dest
}

function symlink() {
  src=$1
  dest=$2

  if [ -e $dest ]; then
    if [ -L $dest ]; then
      # Already symlinked -- I'll assume correctly.
      return
    else
      # Rename files with a ".old" extension.
      echo "$dest already exists, renaming to $dest.old"
      backup=$dest.old
      if [ -e $backup ]; then
        echo "Error: $backup already exists. Please delete or rename it."
        exit 1
      fi
      mv -v $dest $backup
    fi
  fi
  ln -sf $src $dest
}

# check git
if ! which git >/dev/null ; then
  echo "Error: git is not installed"
  exit 1
fi

# clone or update git repo
if [ -d $basedir/.git ]; then
  echo "Updating dotfiles using existing git..."
  cd $basedir
  git pull --quiet --rebase origin master
else
  echo "Checking out dotfiles using git..."
  rm -rf $basedir
  git clone --quiet --depth=1 $repourl $basedir
fi

# create symbol links from $basedir to $HOME
cd $basedir
echo "Creating symlinks..."
for path in .* ; do
  case $path in
    .|..|.git|.gitignore|.ssh)
      continue
      ;;
    *)
      symlink $basedir/$path $HOME/$path
      ;;
  esac
done
symlink $basedir/.vim/vimrc $HOME/.vimrc
# copy instead of symlink to avoid other new files created later adding into repo
copy $basedir/.ssh $HOME/.ssh

# install/update vim plugins
echo "Setting up vim plugins..."
.vim/update.sh

postinstall=$HOME/.postinstall
if [ -e $postinstall ]; then
  echo "Running post-install for os-specific dotfiles"
  # check os type
  if [ "$(uname)" == "Darwin" ]; then
    oscustom=$postinstall/macos
  elif [ "$(uname)" == "Linux" ]; then
    oscustom=$postinstall/ubuntu
  else
    echo "unsupported os type."
    return
  fi

  cd $oscustom
  # symlink os custom
  for path in .* ; do
    case $path in
      .|..)
        continue
        ;;
      *)
        symlink $oscustom/$path $HOME/$path
        ;;
    esac
  done
else
  echo "No post install script found. Optionally create one at $postinstall"
fi

echo "Done."

} # This ensures the entire script is downloaded.
