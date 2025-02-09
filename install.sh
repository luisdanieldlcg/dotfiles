#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES=$HOME/dotfiles/.config

find -H "$DOTFILES" -name 'link.path' | while read linkfile
do
  cat "$linkfile" | while read line
  do
    src=$(eval echo "$line" | cut -d '=' -f 1)
    dst=$(eval echo "$line" | cut -d '=' -f 2)
    dir=$(dirname "$dst")gs 
    echo "Linking $dst -> $src"
    mkdir -p "$dir"
    rm -rf $dst
    ln -s $src $dst
  done  
done 