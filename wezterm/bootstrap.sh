#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common.sh"

install_wezterm() {
  local overwrite_all=false backup_all=false skip_all=false
  link_file "${DOTFILES_DIR}/wezterm" "${HOME}/.config/wezterm"
}

install_wezterm
