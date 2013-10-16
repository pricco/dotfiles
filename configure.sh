mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim 
curl -Sso ~/.vim/colors/Monokai.vim https://raw.github.com/sickill/vim-monokai/master/colors/Monokai.vim
git submodule init
ln -s  $HOME/.vim/.vimrc $HOME/.vimrc

#python
sudo pip install flake8
