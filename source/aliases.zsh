# odds and ends
alias lfp='look_for_process'
alias updb='sudo /usr/libexec/locate.updatedb'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias ct='update_ctags 2>&1 > /dev/null'
alias myip='ipconfig getifaddr en1 || ipconfig getifaddr en0'

if [ -x "$(command -v bat)" ]; then
    alias cat='bat -p'
fi

# shpotify
alias sp='spotify'
alias spp='spotify play'
alias spa='spotify pause'
alias spn='spotify next'
alias spr='spotify prev'
alias spq='spotify quit'
alias sps='spotify stop'
alias spv='spotify vol'
alias spst='spotify status'
alias spsh='spotify toggle shuffle'
alias sprp='spotify toggle repeat'

# git
alias upfork='git fetch upstream; git checkout master; git merge upstream/master'
alias gdi='git diff --ignore-all-space'
alias gcb='git checkout -b'
alias grp='git grep -n'
alias gcu='git gc --aggressive'
alias glr='git rev-list --left-right --count master...'
alias gmb='git merge-base $(current_branch) master'
alias since='git log --oneline --decorate $(git merge-base --fork-point master)..HEAD'
alias gdw='git diff --color-words'
alias gst='git status -sb'
alias goop='git reset --soft HEAD~1'
alias gun='git reset HEAD --'

##########
# Python #
##########

# pip
alias upip='pip freeze --local | \grep -v "^\-e" | cut -d = -f 1  | xargs -n1 pip install -U'
alias pir='pip install -r '
alias prq='pip install -r requirements.txt'
alias pil='pip list'
alias pie='pip install -e'
alias pup='pip install -U pip'
alias psh='pipenv shell'

# Django
alias run='./manage.py runserver'
alias shell='./manage.py shell'

#############
# Built-ins #
#############

# grep
alias grep='grep -n --color=auto'

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
alias dif='diff --side-by-side --suppress-common-lines'
