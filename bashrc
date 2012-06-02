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
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'

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

### OSX-specific stuff
if [ `uname` == "Darwin" ] ; then
	alias ls="ls -G"
	export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
	if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
		. /usr/local/git/contrib/completion/git-completion.bash
	fi
fi

### autostart
#fixagent
