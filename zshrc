export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kolo"

ENABLE_CORRECTION="true"

plugins=(git django virtualenvwrapper mvn npm pip python history history-substring-search)

source $ZSH/oh-my-zsh.sh

workon sandbox

export REPOS_HOME=${HOME}/source

export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=vim

alias grep='ggrep -n --color=auto'
alias pyserv='python -m SimpleHTTPServer'
alias ql='qlmanage -p 2>/dev/null'
alias c='clear'
alias svi='sudo vi'
alias nrd='sudo nginx -s reload'
alias nst='sudo nginx'
alias nsp='sudo nginx -s stop'
alias wget='wget -c'

upmaster() {
    pushd $REPOS_HOME 2>&1 > /dev/null;
    echo '\nUpdating master branches'
    echo '------------------------'
    for repo in `ls`; do
        echo
        echo $repo...
        pushd $repo 2>&1 > /dev/null
        git checkout master
        git pull
        popd 2>&1 > /dev/null
    done
    popd 2>&1 > /dev/null
}
