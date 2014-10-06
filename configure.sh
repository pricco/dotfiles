mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
cd ~/.vim
curl -Sso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
git submodule init
git submodule update
ln -s  $HOME/.vim/.vimrc $HOME/.vimrc
ln -s  $HOME/.vim/.tmux.conf $HOME/.tmux.conf
vim +PluginInstall +qall

#python
sudo pip install flake8 jedi
