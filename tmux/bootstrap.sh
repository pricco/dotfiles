#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common.sh"

install_tmux() {
  local overwrite_all=false backup_all=false skip_all=false
  local base="${DOTFILES_DIR}/tmux"
  mkdir -p "${HOME}/.tmux/plugins/onedark"
  link_file "${base}/.tmux.conf" "${HOME}/.tmux.conf"
  link_file "${base}/onedark.tmux" "${HOME}/.tmux/plugins/onedark/onedark.tmux"
  clone "${HOME}/.tmux/plugins/tpm" "git@github.com:tmux-plugins/tpm.git" "master"
}

install_tmux
