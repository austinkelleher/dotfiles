#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

files=(dependencies.sh configure-zsh.sh configure-git.sh)

for file in "${files[@]}"
do
    ./$SCRIPT_DIR/$file
done
