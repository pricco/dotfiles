#!/bin/bash

install_vim () {
  local dir="${HOME}/.dotvim"
  local git="git@github.com:pricco/dotvim.git"
  local branch="3.0"

  program_exists "git"
  clone "${dir}" "${git}" "${branch}"
  source "${dir}/bootstrap.sh"
}

install_vim
