#!/usr/bin/env bash
set -euo pipefail

# trap 'echo "[ERROR] Línea $LINENO ejecutando $BASH_COMMAND"' ERR
#
source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

DOTFILES_REPO="git@github.com:pricco/dotfiles.git"
DOTFILES_BRANCH="master"


dotfiles_install() {
  program_exists "git"
  clone "$DOTFILES_DIR" "$DOTFILES_REPO" "$DOTFILES_BRANCH"
  for dir in "$DOTFILES_DIR"/*/; do
    echo $dir
    [ -d "$dir" ] || continue
    if [ -f "$dir/bootstrap.sh" ]; then
      if ! source "$dir/bootstrap.sh" "$@"; then
        info 1 "Error in $dir/bootstrap.sh"
      fi
    fi
  done
}

dotfiles_install "$@"
