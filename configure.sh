mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
curl -Sso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
git submodule init
git submodule update
ln -s  $HOME/.vim/.vimrc $HOME/.vimrc
vim +BundleInstall +qall

#python
sudo pip install flake8 jedi
