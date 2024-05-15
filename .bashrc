#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias sc="/usr/bin/git --git-dir=$HOME/.sopho-config/ --work-tree=$HOME"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias spm='sc push -u origin main'
alias sf='sc fetch'
alias spull='sc pull'
alias scc='sc commit -m'
