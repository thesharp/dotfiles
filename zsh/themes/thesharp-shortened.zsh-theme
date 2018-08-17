# oh-my-zsh thesharp theme
# based on "bureau"

### Git [±master ▾●]

ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[240][ %{$fg_bold[white]%}\uE0A0 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[240] ]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status() {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)
  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $_STATUS
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}


_PATH="%{$fg_bold[blue]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[yellow]%}(ssh) "
  fi
}

function username() {
  if [[ $USER != "sharp" ]]; then
    echo "$_USERNAME "
  fi
}

function virtualenv_info {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      echo " $FG[240][ %{$reset_color%}%{$fg_bold[white]%}\u2731%{$reset_color%} ${VIRTUAL_ENV:t}$FG[240] ]%{$reset_color%} "
  fi
}

_1LEFT='$(ssh_connection)$(username)$_PATH$(bureau_git_prompt)$(virtualenv_info)'
# _1RIGHT="[%*] "

bureau_precmd () {
  # _1SPACES=`get_space $_1LEFT $_1RIGHT`
  # print
  # print -rP "$_1LEFT$_1SPACES$_1RIGHT"
  print -rP "%(?..%{$fg[red]%})➤%{$reset_color%} $_1LEFT"
}

setopt prompt_subst
PROMPT="$_LIBERTY "
# RPROMPT='$(nvm_prompt_info) $(bureau_git_prompt)'

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd

function _clear_screen() {
  # enable output to terminal
  zle -I
  # clear screen and move cursor to (0, 0)
  print -n '\e[2J\e[0;0H'
  # print preprompt
  bureau_precmd
}

zmodload zsh/zle
zle -N clear-screen _clear_screen

