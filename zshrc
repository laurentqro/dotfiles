export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="pure"
[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

export EDITOR=vim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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

export VISUAL=vim
export EDITOR="$VISUAL"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
