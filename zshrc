# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="thesharp"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/dotfiles/zsh

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ `uname` == "Darwin" ]] ; then
	alias ls="ls -G"
	alias top="top -s1 -o cpu -R -F"
	alias tor-ssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9150 %h %p"'
	alias osxlock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
	alias git="hub"

	export PATH=/usr/local/sbin:/usr/local/bin:$HOME/dotfiles/bin:/usr/local/share/npm/bin:$HOME/.rvm/bin:$PATH
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	export GOPATH=/usr/local/opt/go
	export PATH=$PATH:$GOPATH/bin

	# homebrew
	if [ -d /usr/local/share/zsh-completions ] ; then
		fpath=(/usr/local/share/zsh-completions $fpath)
	fi

	# pyenv (https://github.com/yyuu/pyenv) stuff
	if which pyenv > /dev/null; then eval "$(pyenv init -)" ; pyenv virtualenvwrapper ; fi
fi

alias scp="noglob scp"

export VIRTUAL_ENV_DISABLE_PROMPT=1

export EDITOR=vim
export PAGER=less
export HISTCONTROL=ignoredups
export TERM=screen-256color
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew django fabric Forklift github pip pyenv python sudo virtualenvwrapper)
