#!/usr/bin/env bash

targetdir="$1"

create_dir() {
  [ -d "$1" ] ||  mkdir -p "$1"
}

usefile() { 
  ln -s "${targetdir}"/etc/"$1" ~/"$1"; 
}

usereposfile() {
  ln -s "${targetdir}"/repos/"$1" ~/"$2";
}

create_dir ~/.config/mc
create_dir ~/etc
create_dir ~/dev
create_dir ~/.ssh
chmod 0770 ~/.ssh
create_dir  "${targetdir}"/etc/.ssh/config.d

usefile .bash_aliases
usefile .gitconfig
usefile .hgrc
usefile .vim
usefile .vimrc
usefile .screenrc
usefile .ssh/config.d
usefile .config/mc/ini
usereposfile vim-pathogen/autoload .vim/autoload


