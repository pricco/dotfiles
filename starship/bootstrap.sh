#!/bin/bash

install_starship () {
  local overwrite_all=false backup_all=false skip_all=false
  mkdir -p "${HOME}/.config/starship" 2>/dev/null
  link_file "${dotfiles_dir}/starship/starship.toml" "${HOME}/.config/starship/starship.toml"
}

install_starship
