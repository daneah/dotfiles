#!/usr/bin/env zsh

ZSH_THEME=kolo.zsh-theme
INVOKE_COMPLETION=invoke-completion.zsh

pushd_quiet() {
    local path_to_push_to=$1
    pushd $path_to_push_to > /dev/null 2>&1
}

popd_quiet() {
    popd > /dev/null 2>&1
}

main() {
    readonly local project_dir=${0:a:h}
    readonly local src_dir=source
    readonly local custom_dir=${HOME}/.zsh-custom

    pushd_quiet $project_dir

    if [ $? -eq 0 ]; then
        pushd_quiet $src_dir

        if [ $? -eq 0 ]; then
            for dotfile in $(ls); do
                local full_path="$(cd "$(dirname "$dotfile")" && pwd)/$(basename "$dotfile")"
                if [ "$(readlink -- "${HOME}/.$dotfile")" != "$full_path" ]; then
                    ln -i -s $full_path ${HOME}/.$dotfile
                fi
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

    themes_dir=$custom_dir/themes
    theme_file=$themes_dir/$ZSH_THEME
    theme_template=$project_dir/$ZSH_THEME
    invoke_completion=$project_dir/$INVOKE_COMPLETION

    mkdir -p $themes_dir
    ln -sf $theme_template $theme_file
    ln -sf $invoke_completion $custom_dir/$INVOKE_COMPLETION
}

main
