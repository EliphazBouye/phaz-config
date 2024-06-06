#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias so="/usr/bin/git --git-dir=$HOME/.sopho-config/ --work-tree=$HOME"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias som='so push -u origin main'
alias sof='so fetch'
alias sop='so pull'
alias socm='so commit -m'

# NodeJS
export PATH=$HOME/Programming/nodejs/node-v20.14.0-linux-x64/bin:$PATH
