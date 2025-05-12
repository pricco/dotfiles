#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common.sh"

DOTZSH_DIR="${HOME}/.zprezto"
DOTZSH_GIT="git://github.com/pricco/dotzsh.git"
DOTZSH_BRANCH="master"

zsh_install() {
  program_exists "git"
  clone "${DOTZSH_DIR}" "${DOTZSH_GIT}" "${DOTZSH_BRANCH}"
  local overwrite_all=false backup_all=false skip_all=false
  local files=("zlogin" "zlogout" "zpreztorc" "zprofile" "zshenv" "zshrc")
  for file in "${files[@]}"; do
    link_file "${DOTZSH_DIR}/runcoms/${file}" "${HOME}/.${file}"
  done
  unset file
}

zsh_install
