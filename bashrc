# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

### prompt stuff
function git_branch {
	branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
	if [ $branch ] ; then
		echo " "$branch
	fi
}

export PS1='[\u@\h \W\[\e[1;32m\]$(git_branch)\[\e[0m\]]\$ '

### fix agent inside screen
function fixagent {
	export SSH_AUTH_SOCK=`find /tmp/ssh* -type s -user sharp -name 'agent.*' 2> /dev/null`
}

### variables
export EDITOR=vim
export PAGER=less
export HISTCONTROL=ignoredups

### aliases
alias mutt="env TERM=xterm-256color mutt"

### autostart
#fixagent
