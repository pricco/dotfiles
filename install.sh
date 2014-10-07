#!/bin/bash

DOTFILES=$HOME/.dotfiles

if [ ! -d "$DOTFILES" ]; then
    echo "Installing YADR for the first time"
    git clone --recursive git://github.com/pricco/dotfiles.git "$DOTFILES"
    sudo bash $DOTFILES/bootstrap.sh
else
    echo "dotfiles is already installed"
fi
