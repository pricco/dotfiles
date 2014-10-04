# Vim Configuration

    ./configure.sh

# Fonts (zsh and powerline)

* https://gist.github.com/baopham/1838072
* https://github.com/Lokaltog/powerline/issues/96
* Mocaco (patched)

# Tmux (~/.tmux.conf)

``` tmux
# Smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys 'C-\\') || tmux select-pane -l"
```

# Format Code

* https://github.com/Chiel92/vim-autoformat

# Sources

* http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
* https://github.com/kien/ctrlp.vim
* http://nvie.com/posts/how-i-boosted-my-vim/
