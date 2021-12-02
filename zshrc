#################
#    INIT
#################

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
export EDITOR="vim"
export TERM=screen-256color-bce
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1

[ -e ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -e "~/.ghcup/env" ] && source "~/.ghcup/env" # ghcup-env
[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
plugins=(git)

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# =============
#    ALIAS
# =============

alias g="git"
alias k="kubectl"
alias vim="nvim"
alias be="bundle exec"

# ======================
#    UTILITY FUNCTIONS
# ======================

remove_all_containers() { docker container rm -f $(docker container ps -a -q) }
remove_all_images() { docker image rm -f $(docker images -a -q) }
ip() { ifconfig -a | grep inet | grep broadcast | awk '{ print $2 }' }

# =============
#    HISTORY
# =============

## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history

# =============
#    PROMPT
# =============

autoload -U colors && colors
setopt promptsubst

git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

kube_context() {
  context=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
  if [[ -n $context ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$context$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$(kube_context)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%} ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

# ===================
#    AUTOCOMPLETION
# ===================

# enable completion
autoload -Uz compinit
compinit

zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

# case-insentive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# use different colors for directories and files
zstyle ':completion:*' list-colors ''

# format autocompletion for `kill -9 {string}`
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
