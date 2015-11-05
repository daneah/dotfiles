# nginx
alias nst='sudo nginx'
alias nrd='sudo nginx -s reload'
alias nsp='sudo nginx -s stop'

# git
alias gdi='git diff --ignore-all-space'
alias gcb='git checkout -b'
alias grp='git grep -n'
alias gcu='git gc --aggressive'
alias glr='git rev-list --left-right --count master...'
alias gmb='git merge-base $(current_branch) master'

##########
# Python #
##########

# pip
alias upip='pip freeze --local | \grep -v "^\-e" | cut -d = -f 1  | xargs -n1 pip install -U'
alias pir='pip install -r '
alias pil='pip list'

# virtualenv(wrapper)
alias wo='workon'

# Django
alias run='./manage.py runserver'
alias shell='./manage.py shell'

#############
# Built-ins #
#############

# grep
alias grep='grep -n --color=auto'
alias -g gv='| grep -v'
alias -g s='| grep'

# screen
alias scs='screen -S'
alias scr='screen -r'

# Miscellaneous
alias rmf='rm -rf'
alias -g b64d='| base64 -D'
alias -g b64='| base64'
alias pyserv='python -m SimpleHTTPServer'
alias ql='qlmanage -p 2>/dev/null'
alias c='clear'
alias svi='sudo vi'
alias wget='wget -c'
alias named='find . -name'
alias vi=vim
