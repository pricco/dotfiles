#!/bin/bash

dotzsh_dir="${HOME}/.zprezto"
dotzsh_git="git://github.com/pricco/dotzsh.git"
dotzsh_branch="master"


zsh_install () {
  program_exists "git"
  clone "${dotzsh_dir}" "${dotzsh_git}" "${dotzsh_branch}"
  local overwrite_all=false backup_all=false skip_all=false
  local files=("zlogin" "zlogout" "zpreztorc" "zprofile" "zshenv" "zshrc")
  for file in "${files[@]}"; do
    link_file "${dotzsh_dir}/runcoms/${file}" "${HOME}/.${file}"
  done
  unset file
}

zsh_install
