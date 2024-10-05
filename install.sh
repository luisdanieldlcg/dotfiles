#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES=$HOME/dotfiles/.config


install() {
  
  find -H "$DOTFILES" -name 'link.path' | while read linkfile
  do
    cat "$linkfile" | while read line
    do
      local src dst dir
      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname "$dst")
      echo "The directory: $dst will be linked (symlink) to $src"
      mkdir -p "$dir"
      link_file "$src" "$dst"
    done  
  done 
}

link_file() {
  local src=$1 dst=$2
  rm -rf $dst
  ln -s $src $dst
 }

install
