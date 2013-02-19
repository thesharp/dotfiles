# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# colors (numbers are from http://misc.flogisoft.com/_media/bash/colors_format/256_colors_fg.png)
RED=$(tput setaf 196)
GREEN=$(tput setaf 154)
BLUE=$(tput setaf 61)
NORMAL=$(tput sgr0)

### prompt stuff
function git_branch {
	branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
	if [ $branch ] ; then
		echo " "$branch
	fi
}

function venv {
	if [ $VIRTUAL_ENV ] ; then
		echo "(`basename $VIRTUAL_ENV`) "
	fi
}

function prompt_command {
	GIT_STATUS=$(git status --porcelain 2>/dev/null)
	if [[ -n $GIT_STATUS ]] ; then
		GIT_DIRTY=1
	else
		GIT_DIRTY=0
	fi
	if [ $GIT_DIRTY -eq 1 ] ; then
		export PS1='\[${BLUE}\]$(venv)\[${NORMAL}\][\u@\h \W\[${RED}\]$(git_branch)\[${NORMAL}\]]$ '
	else
		export PS1='\[${BLUE}\]$(venv)\[${NORMAL}\][\u@\h \W\[${GREEN}\]$(git_branch)\[${NORMAL}\]]$ '
	fi
	echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"
}

export PROMPT_COMMAND=prompt_command

### fix agent inside screen
function fixagent {
	eval export SSH_AUTH_SOCK=`find /tmp/ssh* -type s -user sharp -name 'agent.*' 2> /dev/null`
}

### variables
export EDITOR=vim
export PAGER=less
export HISTCONTROL=ignoredups
export TERM=xterm-256color

### aliases
alias mutt="env TERM=xterm-256color mutt"

### OSX-specific stuff
if [ `uname` == "Darwin" ] ; then
	alias ls="ls -G"
	export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	export PATH=$PATH:/usr/local/git/bin:/usr/local/sbin:$HOME/dotfiles/bin
	if [ -f `brew --prefix`/Cellar/bash-completion/1.3/etc/bash_completion ]; then
		. `brew --prefix`/Cellar/bash-completion/1.3/etc/bash_completion
	fi
	if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
		. /usr/local/git/contrib/completion/git-completion.bash
	fi

	# pythonbrew (https://github.com/utahta/pythonbrew) stuff
	[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

	# virtualenvwrapper (http://pypi.python.org/pypi/virtualenvwrapper) stuff
	export WORKON_HOME=$HOME/.pythonbrew/venvs
	. virtualenvwrapper.sh
fi

### autostart
#fixagent
