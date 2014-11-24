#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_GIT="git://github.com/pricco/dotfiles.git"
DOTFILES_BRANCH="master"

DOTZSH_DIR="$HOME/.dotzsh"
DOTZSH_GIT="git://github.com/pricco/dotzsh.git"
DOTZSH_BRANCH="master"

DOTVIM_DIR="$HOME/.dotvim"
DOTVIM_GIT="git://github.com/pricco/dotvim.git"
DOTVIM_BRANCH="3.0"

VUNDLE_DIR="$HOME/.vim/bundle/vundle"
VUNDLE_GIT="git://github.com/gmarik/vundle.git"
VUNDLE_BRANCH="master"

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

clone() {
    if [ ! -e "$1" ]; then
        git clone --recursive "$2" "$1" &&
        cd "$1" &&
        git submodule init &&
        git submodule update
    else
        cd "$1" &&
        git pull -q origin "$3"
    fi
    ret="$?"
    success "$4"
}

sync_dotfiles() {
    rsync -FLa /home/pricco/.dotfiles/ /home/pricco/
    ret="$?"
    success "$1"
}

install_deps() {
    sudo pip install -q flake8 jedi term2048
    ret="$?"
    success "$1"
}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    vim \
        -u "$HOME/.vimrc.bundles.default" \
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
    program_exists "rsync" "Sorry, we cannot continue without RSYNC, please install it first."
    program_exists "pip" "Sorry, we cannot continue without PIP, please install it first."

    clone $DOTFILES_DIR $DOTFILES_GIT $DOTFILES_BRANCH "Successfully cloned dotfiles"
    clone $DOTVIM_DIR $DOTVIM_GIT $DOTVIM_BRANCH "Successfully cloned dotvim"
    clone $DOTZSH_DIR $DOTZSH_GIT $DOTZSH_BRANCH "Successfully cloned dotzsh"
    clone $VUNDLE_DIR $VUNDLE_GIT $VUNDLE_BRANCH "Successfully cloned vundle"

    sync_dotfiles "Successfully sync dotfiles"
    install_deps "Successfully installed dependencies"
    setup_vundle "Now updating/installing plugins using Vundle"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
else
    if [ "$1" == "--sync" -o "$1" == "-s" ]; then
        sync_dotfiles "Successfully sync dotfiles"
    else
        read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
        echo "";
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            install
        fi
    fi
fi
