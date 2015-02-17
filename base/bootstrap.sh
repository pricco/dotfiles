#!/bin/bash

install_base () {
  local base="${dotfiles_dir}/base"
  local overwrite_all=false backup_all=false skip_all=false
  local files=(".editorconfig" ".gitconfig" ".gitattributes" ".gitignore", ".osx")
  for file in "${files[@]}"; do
    link_file "${base}/${file}" "${HOME}/${file}"
  done
  unset file
}

install_base
