# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh" ]]; then
  source "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh"
fi

# Aliases
alias a="tmux attach -t"
alias g="git"
alias v="vim"
alias t="tmux"
alias c="cd"
alias s="spring"
alias be="bundle exec"

alias v='vim'
alias vim='vim'

alias nom="rm -rf node_modules && npm cache clean && npm install"
alias bom="rm -rf bower_components && bower cache clean && bower install"
alias nombom="nom && bom"

alias ctags="`brew --prefix`/bin/ctags"

export VISUAL=vim
export EDITOR="$VISUAL"

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
eval "$(rbenv init -)"
