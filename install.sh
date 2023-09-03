#!/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
export DOTFILES=$DOTFILES_DIR
# Use 'find' to recursively search for files
find "$DOTFILES_DIR" -type f -name "*.sh" -not -path "$DOTFILES_DIR/install.sh" | while read -r file; do
  sh $file
done
