#!/bin/bash

install_nvim () {
  local overwrite_all=false backup_all=false skip_all=false
  link_file "${dotfiles_dir}/nvim" "${HOME}/.config/nvim"
}

install_nvim
