# /etc/bashrc

# Don't repeat commands in history
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

[[ -f /etc/bash_aliases ]] && . /etc/bash_aliases

# Sanity check for sensitive operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep with colors is readable
alias grep='grep --color=auto -n'

# Stop typing so much
alias ls='ls --color=auto'
alias latr='ls -latr'
alias ll='ls -l'

# Better ls colors
eval "$(dircolors -b /etc/DIR_COLORS)"

# Always use vim
alias vi='vim'

# Common misspellings
alias got='git'
alias vo='vi'
alias ci='vi'
alias cd..='cd ..'
alias sl='ls'
alias snv='svn'

# Allow installation to system's Python modules
syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Mac-specific settings
if [[ "$OSTYPE" == darwin* ]]; then
	alias updatedb='/usr/libexec/locate.updatedb'
fi
