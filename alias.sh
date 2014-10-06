# Function to switch and save the current path
function cd() {  
    builtin cd "$@";
    echo "$PWD" > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'

# Tmux
alias tmux="tmux -2"
alias tml="tmux list-sessions"
alias tma="tmux attach-session"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session"
alias tw="tmux new-session \; \
          split-windowi -h -p 40 \; \
          select-pane -L \;"
alias tvim="tmux new-session 'vim' \; \
            rename-window 'vim' \; \
            split-window -h -p 45 \; \
            select-pane -L \;"
