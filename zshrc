# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="thesharp-shortened"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ `uname` == "Darwin" ]] ; then
	alias ls="ls -G"
	alias top="top -s1 -o cpu -R -F"
	alias tor-ssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9150 %h %p"'
	alias osxlock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
	alias git="hub"
	alias vim="nvim"
	alias ag="rg"

	export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:$HOME/dotfiles/bin:/opt/homebrew/share/npm/bin:$HOME/.rvm/bin:$PATH
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/shims:$PATH"
	export GOPATH=$HOME/Projects/go
	export PATH=$PATH:$GOPATH/bin

	# homebrew
	if [ -d /opt/homebrew/share/zsh-completions ] ; then
		fpath=(/opt/homebrew/share/zsh-completions $fpath)
	fi
	export HOMEBREW_NO_AUTO_UPDATE=1

	# pyenv (https://github.com/yyuu/pyenv) stuff
	if which pyenv > /dev/null; then eval "$(pyenv init -)" ; pyenv virtualenvwrapper ; fi

	# fzf / ag
	export FZF_DEFAULT_COMMAND='rg --files --vimgrep'
fi

alias scp="noglob scp"
alias clickhouse-client="docker run -it clickhouse/clickhouse-server:23.8.4 clickhouse-client"
alias kg="kubectl get"
alias kd="kubectl describe"
alias ka="kubectl apply"
alias kc="kubectx"
alias kn="kubens"

export VIRTUAL_ENV_DISABLE_PROMPT=1

export EDITOR=nvim
export PAGER=less
export HISTCONTROL=ignoredups
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;37:cd=1;37:su=1;32;41:sg=1;32;44:tw=1;34;41:ow=1;34;41"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/mc mc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

enq() {
	echo -n "$1" | base64
}

dnq() {
	echo -n "$1" | base64 --decode
}
