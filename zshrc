export PATH="/usr/local/Cellar:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/shims:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"

export PYENV_ROOT="$HOME/.pyenv"

[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
plugins=(git)

export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
alias g="git"
alias k="kubectl"
alias vim="nvim"
alias ctags="`brew --prefix`/bin/ctags"

eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(jenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "~/.ghcup/env" ] && source "~/.ghcup/env" # ghcup-env
