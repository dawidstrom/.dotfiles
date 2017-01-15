#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -F --color=auto'
alias ll='ls -Fl --color=auto'
alias la='ls -Fa --color=auto'
alias lla='ls -Fla --color=auto'
alias l='ls -F --color=auto'
alias gött='git'

alias open='xdg-open'
PS1='[\u@\h \W]\$ $(gp)'

export EDITOR="vim"
export PATH=/home/time/.cabal/bin:/home/time/.gem/ruby/2.3.0/bin:/usr/bin/:/home/time/bin:$PATH

function gp() {
	x=$(git rev-parse 2>/dev/null; echo $?);
	y=$(git rev-parse --abbrev-ref HEAD 2>/dev/null; echo $?);
	if [[ $x == "0" && $y == "0" ]]; then
		echo -n "["`git rev-parse --abbrev-ref HEAD` "|" `git status -s | awk '{print $1}' | uniq -c` "] "
	fi
}
