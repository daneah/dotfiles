# odds and ends
alias lfp='look_for_process'
alias updb='sudo /usr/libexec/locate.updatedb'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias ff='open -a /Applications/Firefox\ Developer\ Edition.app'
alias ct='update_ctags 2>&1 > /dev/null'
alias myip='ipconfig getifaddr en1 || ipconfig getifaddr en0'

if [ -x "$(command -v bat)" ]; then
    alias cat='bat --plain'
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
alias upfork='git fetch upstream; git checkout $(git_main_branch); git merge upstream/$(git_main_branch)'
alias gdi='git diff --ignore-all-space'
alias gdw='git diff --color-words'
alias gcb='git checkout -b'
alias grp='git grep --line-number'
alias gcu='git gc --aggressive'
alias glr='git rev-list --left-right --count master...'
alias gmb='git merge-base $(current_branch) master'
alias since='git log --oneline --decorate $(git merge-base --fork-point $(git_main_branch))..HEAD'
alias gst='git status --short --branch'
alias goop='git reset --soft HEAD~1'
alias gun='git reset HEAD --'
alias gai='git add --intent-to-add'

##########
# Python #
##########

# pip
alias upip='py -m pip freeze --local | \grep -v "^\-e" | cut -d = -f 1  | xargs -n1 py -m pip install --upgrade'
alias pir='py -m pip install --requirement '
alias prq='py -m pip install --requirement requirements.txt'
alias pil='py -m pip list'
alias pie='py -m pip install --editable'
alias pup='py -m pip install --upgrade pip setuptools wheel'
alias psh='pipenv shell'

#############
# Built-ins #
#############

# grep
alias grep='grep --line-number --color=auto'

# screen
alias scs='screen -S'
alias scr='screen -r'

# Miscellaneous
alias rmf='rm -rf'
alias -g b64d='| base64 --decode'
alias -g b64='| base64'
alias pyserv='python -m SimpleHTTPServer'
alias ql='qlmanage -p 2>/dev/null'
alias c='clear'
alias svi='sudo vi'
alias wget='wget -c'
alias named='find . -name'
alias vi=nvim
alias vim=nvim
alias dif='diff --side-by-side --suppress-common-lines'
