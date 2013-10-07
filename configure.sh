mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
curl -Sso ~/.vim/colors/monokai.vim https://raw.github.com/sickill/vim-monokai/master/colors/Monokai.vim
git submodule init
cp .vimrc ~/.vimrc
