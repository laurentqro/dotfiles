export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="pure"
[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
plugins=(git)

export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
alias t="tmux"
alias tat="tmux attach -t"

alias g="git"
alias gs="git status"

alias be="bundle exec"

alias nom="rm -rf node_modules && npm cache clean && npm install"
alias bom="rm -rf bower_components && bower cache clean && bower install"
alias nombom="nom && bom"

alias ctags="`brew --prefix`/bin/ctags"

# pg
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
