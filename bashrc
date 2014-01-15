# /etc/bashrc

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
