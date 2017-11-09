#!/usr/bin/env bash
#
# Usage: ./update.sh [pattern]
#
# Specify [pattern] to update only repos that match the pattern.

repos=(

  # easymotion/vim-easymotion
  # ervandew/supertab
  # roxma/ncm-clang
  # roxma/nvim-completion-manager
  # roxma/vim-hug-neovim-rpc
  Chiel92/vim-autoformat
  SirVer/ultisnips
  airblade/vim-gitgutter
  alampros/vim-styled-jsx
  altercation/vim-colors-solarized
  benmills/vimux
  haya14busa/incsearch.vim
  honza/vim-snippets
  itchyny/lightline.vim
  jceb/vim-orgmode
  junegunn/fzf.vim
  junegunn/goyo.vim
  lervag/vimtex
  majutsushi/tagbar
  maralla/completor.vim
  mbbill/undotree
  mhinz/vim-startify
  mileszs/ack.vim
  nathanaelkane/vim-indent-guides
  python-mode/python-mode
  qpkorr/vim-bufkill
  scrooloose/nerdtree
  sheerun/vim-polyglot
  terryma/vim-multiple-cursors
  tomasr/molokai
  tpope/vim-commentary
  tpope/vim-eunuch
  tpope/vim-fugitive
  tpope/vim-pathogen
  tpope/vim-repeat
  tpope/vim-rhubarb
  tpope/vim-sleuth
  tpope/vim-speeddating
  tpope/vim-surround
  tpope/vim-unimpaired
  w0rp/ale
  wellle/targets.vim

)

set -e
dir=$HOME/.vim/bundle

if [ -d $dir -a -z "$1" ]; then
  temp="$(mktemp -d -t bundleXXXXX)"
  echo "▲ Moving old bundle dir to $temp"
  mv "$dir" "$temp"
fi

mkdir -p $dir

for repo in ${repos[@]}; do
  if [ -n "$1" ]; then
    if ! (echo "$repo" | grep -i "$1" &>/dev/null) ; then
      continue
    fi
  fi
  plugin="$(basename $repo | sed -e 's/\.git$//')"
  [ "$plugin" = "vim-styled-jsx" ] && plugin="000-vim-styled-jsx" # https://goo.gl/tJVPja
  dest="$dir/$plugin"
  rm -rf $dest
  (
    git clone --depth=1 -q https://github.com/$repo $dest
    rm -rf $dest/.git
    echo "· Cloned $repo"
  ) &
done
wait
