mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim 
curl -Sso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
git submodule init
ln -s  $HOME/.vim/.vimrc $HOME/.vimrc

#python
sudo pip install flake8 jedi
