# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Downloads"
alias s="cd ~/sophilabs"
alias g="git"
alias h="history"

colorflag="--color"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Tmux
alias tml="tmux list-sessions"
alias tma="tmux attach-session"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session"
alias tvim="tmux new-session -n vim 'vim' \; \
            split-window -h -p 45 \; \
            select-pane -L \;"

function ve() {
    PROJECT=$(basename $(pwd))
    if [ -d "${WORKON_HOME}/${PROJECT}" ]
    then
        source "${WORKON_HOME}/${PROJECT}/bin/activate"
    fi
}
export ve

function ide() {
    PWD=$(pwd)
    PROJECT=$(basename $PWD)
    PROJECT=${PROJECT//./}
    tmux has-session -t "${PROJECT}" > /dev/null 2>&1
    if [ $? != 0 ]
    then
        tmux -q \
            new-session -s "${PROJECT}" -n editor -c "${PWD}" -d  vim \; \
            split-window -h -p 40 -t "${PROJECT}:editor"\; \
            new-window -t "${PROJECT}" -n server -c "${PWD}" \; \
            new-window -t "${PROJECT}" -n shell -c "${PWD}" \; \
            select-window -t "${PROJECT}:editor" \; \
            select-pane -t "${PROJECT}:editor.1" \; \
            resize-pane -Z -t "${PROJECT}:editor.1" \;
    fi
    tmux -q attach -t "${PROJECT}" > /dev/null 2>&1
}
export ide

# GIT
alias gs="git status"
alias gci="git commit"
alias gfo="git fetch origin"
