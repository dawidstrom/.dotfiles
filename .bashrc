#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
. ~/.config/bashhelpers/git-completion.bash
. ~/.config/bashhelpers/git-prompt.sh

export GIT_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto"

alias ls='ls -F --color=auto'
alias ll='ls -lF --color=auto'
alias l='ls -laF --color=auto'

set nobell=true

export PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'
#export PS1='[\u@\h \W] $(__git_ps1 " (%s)" )\$ '
