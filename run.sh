#! /bin/bash

# This script must be executed from the dotfiles directory
# Which must be located under ~/Projects

# Projects directory
PROJECTS_DIR=~/Projects
# Dotfiles directory
DOTFILES_DIR=$PROJECTS_DIR/dotfiles
# Config directory from this folder. 
LOCAL_USER_CONFIG_DIR=./user/.config/
# Config directory of the user.
USER_CONFIG_DIR=~/.config/
pwd
# Go to user cfg folder
cd $USER_CONFIG_DIR

# If the alacritty folder does not exists, create it.
if ! [ -d alacritty ]; then
  mkdir alacritty
fi 

# Move the alacritty config file
cd $DOTFILES_DIR/ && cd $LOCAL_USER_CONFIG_DIR
mv alacritty.yml $USER_CONFIG_DIR/alacritty

echo done!

