#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common.sh"

install_nvim() {
  local overwrite_all=false backup_all=false skip_all=false
  link_file "${DOTFILES_DIR}/nvim" "${HOME}/.config/nvim"
}

install_nvim
