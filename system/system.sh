#!/usr/bin/env bash

set -euo pipefail

brew update
brew install ripgrep
brew install wget

# Bash
brew install checkmake

# Lua
brew install stylua
brew install lua-language-server

# Python
brew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
latest=$(pyenv install --list | grep -E "^\s*[0-9]+\.[0-9]+\.[0-9]+$" | grep -v - | tail -1 | tr -d ' ')
pyenv install -s "$latest"
pyenv global "$latest"
pip install --upgrade pip
pip install --upgrade ruff
pip install --upgrade python-lsp-server[all]

# Javascript
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
nvm alias default node
npm install -g eslint_d@latest
npm install -g prettier@latest
