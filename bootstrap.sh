#!/bin/bash

DOTFILES=$(dirname "${BASH_SOURCE}")

function install() {
    sudo  pip install powerline-status flake8 jedi term2048
    cd "$DOTFILES"
    git submodule init
    git submodule update
    mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle" "$HOME/.vim/colors"
    rsync --exclude ".git/" --exclude ".gitignore" --exclude ".gitmodules" --exclude "bootstrap.sh" --exclude "install.sh" --exclude "README.md" --exclude "VIM.md" -avh --no-perms "$DOTFILES" ~
    vim +PluginInstall +qall
}

cd "$DOTFILES"
git pull origin master

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	    install
	fi
fi
unset install
