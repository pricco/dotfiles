#!/bin/bash

vim_install () {
    program_exists "curl"
    info $? "Updated plug.vim"
    curl -sfLo "${HOME}/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    local overwrite_all=false backup_all=false skip_all=false
    link_file "${dotfiles_dir}/vim/.vimrc" "${HOME}/.vimrc"
}

vim_install
