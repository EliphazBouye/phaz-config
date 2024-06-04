#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias dpz="/usr/bin/git --git-dir=$HOME/.phaz-config/ --work-tree=$HOME"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias dpm='dpz push -u origin main'
alias dpzf='dpz fetch'
alias dpzpull='dpz pull'
alias dpzcc='dpz commit -m'

# NodeJS
export PATH=$HOME/Programming/nodejs/node-v22.2.0-linux-x64/bin:$PATH
