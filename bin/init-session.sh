#!/bin/bash

yo() {

target_dir=$(find ~/dev -maxdepth 1 -type d  | fzf)

cd "$target_dir"
}

