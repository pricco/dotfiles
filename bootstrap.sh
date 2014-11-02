#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_GIT="git://github.com/pricco/dotfiles.git"

SPF13VIM_DIR="$DOTFILES/exclude/spf13-vim/"

VUNDLE_DIR="$HOME/.vim/bundle/vundle"
VUNDLE_GIT="git://github.com/gmarik/vundle.git"

##### Common functions

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

program_exists() {
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }
    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
        error "$2"
    fi
}


##### Setup functions

clone_dotfiles() {
    if [ ! -e "$DOTFILES_DIR" ]; then
        git clone --recursive "$DOTFILES_GIT" "$DOTFILES_DIR" &&
        cd "$DOTFILES_DIR" &&
        git submodule init &&
        git submodule update
    else
        cd "$DOTFILES_DIR" &&
        git pull -q origin master
    fi
    ret="$?"
    success "$1"
}

clone_vundle() {
    if [ ! -e "$VUNDLE_DIR" ]; then
        git clone -q $VUNDLE_GIT "$VUNDLE_DIR"
    else
        cd "$VUNDLE_DIR" &&
        git pull -q origin master
    fi
    ret="$?"
    success "$1"
}

sync_dotfiles() {
    rsync -F -avh --no-perms "$DOTFILES" "$HOME"
    ret="$?"
    success "$1"
}

install_deps() {
    sudo pip install powerline-status flake8 jedi term2048
    ret="$?"
    success "$1"
}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    vim \
        -u "$VUNDLE_DIR/.vimrc.bundles.default" \
        "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"
    export SHELL="$system_shell"
    success "$1"
}

install() {
    program_exists "vim" "Sorry, we cannot continue without VIM, please install it first."
    program_exists "git" "Sorry, we cannot continue without GIT, please install it first."

    clone_dotfiles "Successfully cloned dotfiles"
    clone_vundle "Successfully cloned vundle"
    sync_dotfiles "Successfulle sync dotfiles"
    install_deps "Successfully installed dependencies"
    setup_vundle "Now updating/installing plugins using Vundle"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	    install
	fi
fi
