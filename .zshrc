# Exports
export KEYTIMEOUT=1
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export TERM="xterm-256color"
# Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/sbin/virtualenvwrapper.sh
source /usr/sbin/virtualenvwrapper_lazy.sh


# Antigen
source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    tmux
    archlinux
    vagrant
    python
    zsh_reload
    # last-working-dir
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
    Tarrasch/zsh-bd
    Tarrasch/zsh-autoenv
    oknowton/zsh-dwim
EOBUNDLES

antigen theme fwalch

antigen apply


# Load exports, aliases, functions, etc.
for file in ~/.{exports,aliases,functions}.zsh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done;
unset file;
