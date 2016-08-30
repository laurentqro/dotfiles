export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="pure"
[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
plugins=(git)

export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
alias vim='mvim -v'
alias r="rails"
alias dbm="db:migrate"
alias t="tmux"
alias tat="tmux attach -t"

alias g="git"
alias gs="git status"
alias gcl='git clone'
alias gcm="git commit -m"
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push'
alias gpf='git push -f'

alias be="bundle exec"
alias bu='bundle update'

alias nom="rm -rf node_modules && npm cache clean && npm install"
alias bom="rm -rf bower_components && bower cache clean && bower install"
alias nombom="nom && bom"

alias ctags="`brew --prefix`/bin/ctags"

# pg
alias pg_restart="pg_stop && pg_start"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
