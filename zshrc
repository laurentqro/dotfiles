export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
plugins=(git)

export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
alias r="rails"
alias g="git"
alias be="bundle exec"
alias ctags="`brew --prefix`/bin/ctags"

eval "$(rbenv init -)"
