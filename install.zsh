#!/usr/bin/zsh

pushd_quiet() {
    local path_to_push_to=$1
    pushd $path_to_push_to > /dev/null 2>&1
}

popd_quiet() {
    popd > /dev/null 2>&1
}

main() {
    readonly local project_dir=`dirname $0` 
    readonly local src_dir=source
    readonly local custom_dir=${HOME}/.zsh-custom

    pushd_quiet $project_dir

    if [ $? -eq 0 ]; then
        pushd_quiet $src_dir

        if [ $? -eq 0 ]; then
            for dotfile in $(ls); do
                local full_path="$(cd "$(dirname "$dotfile")" && pwd)/$(basename "$dotfile")"
                ln -i -s $full_path ${HOME}/.$dotfile
            done
        else
            echo "No dotfiles were found during installation!"
            popd_quiet
            exit 1
        fi
        popd_quiet
    else
        popd_quiet
    fi

    mkdir -p $custom_dir
    mkdir -p $custom_dir/themes

    cp $project_dir/kolo.zsh-theme $custom_dir/themes/kolo.zsh-theme
}

main
