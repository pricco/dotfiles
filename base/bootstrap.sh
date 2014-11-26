#!/bin/bash

install_base () {
  local base="${DOTFILES_DIR}/base"
  local overwrite_all=false backup_all=false skip_all=false
  local files=(".editorconfig" ".gitconfig" ".gitattributes_global" ".gitignore_global")
  for file in "${files[@]}"; do
    link_file "${base}/${file}" "${HOME}/${file}"
  done
}

install_base
