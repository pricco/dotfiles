#!/bin/bash

local dir="${HOME}/.zprezto"
local git="git://github.com/pricco/dotzsh.git"
local branch="master"

install_zsh () {
    program_exists "git"
    clone "${dir}" "${git}" "${branch}"
    source "${dir}/bootstrap.sh"
}

install_zsh
