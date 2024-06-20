#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias dotphaz="/usr/bin/git --git-dir=$HOME/.dotphaz/ --work-tree=$HOME"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias dzs='dotphaz push -u origin main'
alias dzl='dotphaz fetch'
alias dzg='dotphaz pull'
alias dzw='dotphaz commit -m'

# NodeJS
export PATH=$HOME/Programming/nodejs/current/node-v22.3.0-linux-x64/bin:$PATH

alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias lh='ls -lh'

# Golang LSP
export PATH=$HOME/go/bin:$PATH
