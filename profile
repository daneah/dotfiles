# /etc/profile

# [user@host] /path/to/current/directory
# $
export PS1="\[\e]0;\w\a\]\n\[\e[32m\][\u\[\e[33m\]@\[\e[32m\]\h] \[\e[33m\]\W\[\e[0m\]\n\$ "

export EDITOR=vi

# Mac colors
export CLICOLOR=1

[[ -f /etc/git_branch ]] && . /etc/git_branch
