#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common.sh"

install_starship() {
  local overwrite_all=false backup_all=false skip_all=false
  mkdir -p "${HOME}/.config/starship" 2>/dev/null
  link_file "${DOTFILES_DIR}/starship/starship.toml" "${HOME}/.config/starship/starship.toml"
}

install_starship
