update_ctags() {
    ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./.tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") ./
}

google() {
    local query="$*"
    open "https://www.google.com/search?q=${query}"
}

upr() {
    local repo=$1
    : ${repo:=.}
    cd $repo > /dev/null 2>&1
    local repo_dir=$(git rev-parse --show-toplevel)
    local repo_name=$(basename $repo_dir)
    local padded_repo_name_len=$((${#repo_name}+2))
    echo
    echo -n ╔
    printf '═%.0s' {1..$padded_repo_name_len}
    echo ╗
    echo "║ $repo_name ║"
    echo -n ╚
    printf '═%.0s' {1..$padded_repo_name_len}
    echo ╝
    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "$current_branch" != "master" ] && [ "x$current_branch" != "x" ]; then 
        echo Currently on branch $current_branch
        git stash
        git checkout master
    fi

    if [ "x$current_branch" != "x" ]; then
        git pull
        echo "Checking for merged branches..."
        git branch --merged | \grep -v "\*" | xargs -n 1 git branch -d
    fi

    cd - > /dev/null 2>&1
}

up() {
    local orig_dir=`pwd`
    cd $REPOS_HOME > /dev/null 2>&1;
    echo '\nUpdating repositories'
    echo '====================='
    for repo in `ls`; do
        upr $repo
    done
    cd $orig_dir > /dev/null 2>&1
}

guni() {
    local current_dir=`basename $(pwd)`
    if [ -d $current_dir ]; then
        if [ -f $current_dir/wsgi.py ]; then
            echo Serving $current_dir with gunicorn...
            gunicorn --reload -b 127.0.0.1:8080 $current_dir.wsgi &
        else
            echo "Error attempting to serve WSGI via gunicorn!"
        fi
    else
        echo "Error attempting to serve WSGI via gunicorn!"
    fi
}

look_for_process() {
    local ps_name=$1
    ps aux | \grep -v grep | \grep --color $ps_name
}

function setjdk() {
  if [ $# -ne 0 ]; then
    removeJavaFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    #Bash expansion will be "x" if JAVA_HOME set, emptystring if unset
    #http://wiki.bash-hackers.org/syntax/pe#use_an_alternate_value
    if [ -n "${JAVA_HOME+x}" ]; then
      removeJavaFromPath "${JAVA_HOME}/bin"
     fi
    export JAVA_HOME=$(/usr/libexec/java_home -v "$@")
    export PATH=$JAVA_HOME/bin:$PATH
  else
    echo "No argument (i.e. java version e.g. 1.7) specified"
  fi
}

function removeJavaFromPath() {
  if [ $# -ne 0 ]; then
    export PATH="$(echo "$PATH" | sed -E -e "s;:$1;;" -e "s;$1:?;;")"
  else
    echo "No argument (java path) specified"
  fi
}
