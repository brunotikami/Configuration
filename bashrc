#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR="vim"
export LANG="zh_CN.UTF-8"
complete -cf sudo
export HISTSIZE="100"
alias grep='grep --color=auto'
alias cls='clear'
alias ll='ls -l'
alias trs='trs {=zh}'
function _update_ps1() {
   export PS1="$(~/Code/mapleray/Configuration/powerline-shell/powerline-shell.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export PATH=${PATH}:/root/.gem/ruby/2.0.0/bin
export PATH=${PATH}:/home/conan/.gem/ruby/2.0.0/bin
export WORKON_HOME=~/Virtualenvs
source /usr/bin/virtualenvwrapper.sh
source ~/Code/mapleray/Configuration/git-completion.bash
