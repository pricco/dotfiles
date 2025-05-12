#!/usr/bin/env bash

set -euo pipefail

export DOTFILES_DIR="$HOME/.dotfiles"

info() {
    if [ "$1" = "0" ]; then
        printf '\e[32m[✔]\e[0m %b\n' "$2" >&2
    else
        printf '\e[31m[✘]\e[0m %b\n' "$2" >&2
        if [ -z "${3:-}" ] || [ "${3:-}" = "true" ]; then
            exit 1
        fi
    fi
}

user() {
    printf '    %b' "${1}"
}

program_exists() {
    if ! command -v "$1" >/dev/null 2>&1; then
      info 1 "Sorry, we cannot continue without ${1}, please install it first."
    fi
}

clone() {
    local dir="$1"
    local repo="$2"
    local branch="${3:-master}"

    if [ ! -e "$dir" ]; then
        git clone --quiet --recursive "$repo" "$dir" &&
        git -C "$dir" submodule update --init --recursive
        info $? "Cloned ${1}"
    else
        git -C "$dir" pull --quiet origin "$branch" &&
        git -C "$dir" submodule update --init --recursive
        info $? "Updated ${1}"
    fi
}

link_file() {
    local src="$1"
    local dst="$2"

    local overwrite backup skip action

    if [[ ! -e "$src" ]]; then
      info 1 "File $src does not exist."
    fi

    if [ -e "$dst" ] || [ -L "$dst" ]; then

        if [ "$overwrite_all" != "true" ] && [ "$backup_all" != "true" ] && [ "$skip_all" != "true" ]; then

            local currentSrc
            currentSrc=$(readlink "$dst")

            if [ "$currentSrc" = "$src" ]; then
                skip=true
            else
                user "File exists: $dst → $(basename "$src"). What do?\n[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -rn 1 action
                printf "\n"

                case "$action" in
                    o) overwrite=true ;;
                    O) overwrite_all=true ;;
                    b) backup=true ;;
                    B) backup_all=true ;;
                    s) skip=true ;;
                    S) skip_all=true ;;
                    *) ;;
                esac
            fi
        fi

        [ "$overwrite" = "" ] && overwrite=$overwrite_all
        [ "$backup" = "" ] && backup=$backup_all
        [ "$skip" = "" ] && skip=$skip_all

        if [ "$overwrite" = "true" ]; then
            rm -rf "$dst"
            info $? "Removed $dst"
        elif [ "$backup" = "true" ]; then
            mv "$dst" "$dst.backup"
            info $? "Moved $dst to $dst.backup"
        elif [ "$skip" = "true" ]; then
            info 0 "Skipped $src"
            return
        fi
    fi

    ln -s "$src" "$dst"
    info $? "Linked $src to $dst"
}
