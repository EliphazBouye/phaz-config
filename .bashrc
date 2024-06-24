#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias sophofile="/usr/bin/git --git-dir=$HOME/.sophofiles/ --work-tree=$HOME"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias soP='sophofile push -u origin main'
alias sof='sophofile fetch'
alias sop='sophofile pull'
alias som='sophofile commit -m'

# NodeJS
export PATH=$HOME/working_dir/nodejs/current/node-v22.3.0-linux-x64/bin:$PATH

alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias lh='ls -lh'

# Golang LSP
export PATH=$HOME/go/bin:$PATH
