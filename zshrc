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
alias g="git"
alias vim="nvim"
alias ctags="`brew --prefix`/bin/ctags"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(jenv init -)"
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
