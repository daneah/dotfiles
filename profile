# /etc/profile

# [user@host] /path/to/current/directory
# $
PS1="\[\e]0;\w\a\]\n\[\e[32m\][\u\[\e[33m\]@\[\e[32m\]\h] \[\e[33m\]\W\[\e[0m\]\n\$ "
export PS1

EDITOR=vi
export EDITOR

RED="\033[38;5;160m"
GREEN="\033[38;5;34m"
DARK_GREEN="\033[38;5;28m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
ORIGINAL="\033[0;0m"

function git_branch
{
  if [ $(git symbolic-ref HEAD 2> /dev/null) ]
  then
    ref=$(git symbolic-ref HEAD)
    echo -e "$(git_color)"${ref#refs/heads/}"$(echo -e $ORIGINAL)"
  fi  
}

function git_color
{
  if [[ $(git status) == *"Changes not staged"* || $(git status) == *"Untracked files"* || $(git status) == *"Unmerged paths"* || $(git status) == *"Your branc>
  then
    echo -e $RED
  elif [[ $(git status) == *"Changes to be committed"* ]]
  then
    echo -e $GREEN
  else
    echo -e $BLUE
  fi  
}

PS1="\$(git_branch)"$PS1
