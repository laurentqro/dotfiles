export PATH="/usr/bin:/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v6.5.0/bin:$PATH"

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
