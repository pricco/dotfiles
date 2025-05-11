#!/bin/bash

install_wezterm() {
    local overwrite_all=false backup_all=false skip_all=false
    link_file "${dotfiles_dir}/wezterm" "${HOME}/.config/wezterm"
}

install_wezterm
