# Pablo's dotfiles

## Requirements

* wezterm
* tmux
* zsh (zprezto)
* starship
* nvim

## Installation

To install these dotfiles:

```bash
sh -c "`curl -fsSL https://raw.github.com/pricco/dotfiles/master/bootstrap.sh`"
```

### Fix slow vim on mac+iterm+tmux

`defaults write -g KeyRepeat -int 1`

Source: https://github.com/tmux/tmux/issues/353#issuecomment-419286706

### Post Instllation

* Under tmux press `Ctrl+a I` to install the tmux's plugins.

#### Fonts (zsh/vim/tmux)

* https://www.nerdfonts.com/font-downloads

## Inspiration

* https://github.com/hendrikmi/dotfiles/
* https://github.com/skwp/dotfiles
* http://vim.spf13.com/
* http://amix.dk/vim/vimrc.html
* https://github.com/mathiasbynens/dotfiles
* http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
* https://github.com/kien/ctrlp.vim
* http://nvie.com/posts/how-i-boosted-my-vim/
* https://github.com/grota/dotfiles
