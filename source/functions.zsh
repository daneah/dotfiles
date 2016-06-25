google() {
    local query="$*"
    open -a /Applications/Google\ Chrome.app "https://www.google.com/search?q=${query}"
}

upr() {
    local repo=$1
    if [[ ! $repo ]]; then
        repo=.
    fi
    local padded_repo_name_len=$((${#repo}+2))
    echo
    echo -n ╔
    printf '═%.0s' {1..$padded_repo_name_len}
    echo ╗
    echo "║ $repo ║"
    echo -n ╚
    printf '═%.0s' {1..$padded_repo_name_len}
    echo ╝
    cd $repo > /dev/null 2>&1
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
    ps aux | grep -v grep | grep $ps_name
}
