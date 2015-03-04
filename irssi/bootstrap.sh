#!/bin/bash

install_irssi () {
  local base="${dotfiles_dir}/irssi"
  local target="${HOME}/.irssi"
  mkdir -p "${target}"
  local overwrite_all=false backup_all=false skip_all=false
  local files=("config" "default.theme" "solarized-universal.theme")
  for file in "${files[@]}"; do
    link_file "${base}/${file}" "${target}/${file}"
  done
  unset file
}

install_irssi
