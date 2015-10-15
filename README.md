# Pablo's dotfiles
![Screen Shot](https://github.com/pricco/dotfiles/raw/master/screenshot.png)

## Requirements

* zsh
* tmux
* iterm2 (optional)
* ag (optional)

## Installation

To install these dotfiles:

```bash
sh -c "`curl -fsSL https://raw.github.com/pricco/dotfiles/master/bootstrap.sh`"
```

### Post Instllation

* Under tmux press `Ctrl+a I` to install the tmux's plugins.
* Set iTerm2 to read the configuration file from user's home then run `killall cfprefsd` and restart iTerm2 (cmd+q) to reload the configuration.
* Patch the Menlo font to support Powerline characters.
* Set your username and e-mail in ~/.gitconfig

#### Fonts (zsh/vim/tmux)

* http://powerline.readthedocs.org/en/latest/installation/linux.html#patched-font-installation
* http://powerline.readthedocs.org/en/latest/installation/linux.html#fontconfig
* https://gist.github.com/baopham/1838072
* https://github.com/Lokaltog/powerline/issues/96

## Inspiration

* https://github.com/skwp/dotfiles
* http://vim.spf13.com/
* http://amix.dk/vim/vimrc.html
* https://github.com/mathiasbynens/dotfiles
* http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
* https://github.com/kien/ctrlp.vim
* http://nvie.com/posts/how-i-boosted-my-vim/
* https://github.com/grota/dotfiles
