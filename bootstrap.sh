#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function sync() {
	rsync --exclude ".git/" --exclude "bootstrap.sh" --exclude "install.sh" --exclude "README.md" -avh --no-perms . ~;
	source ~/.bash_profile;
}

function vim() {
	echo "aaa"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync;
		vim;
	fi;
fi;
unset doIt;



# CURRENT=`pwd`


# Vim
# ln -s .vim ~/.vim
# mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
# cd ~/.vim
# curl -Sso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
# git submodule init
# git submodule update
# ln -s  $HOME/.vim/.vimrc $HOME/.vimrc
# ln -s  $HOME/.dot/.tmux.conf $HOME/.tmux.conf
# vim +PluginInstall +qall

#python
# sudo pip install flake8 jedi
