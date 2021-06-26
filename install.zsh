#!/usr/bin/env zsh

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

    invoke_completion=$project_dir/$INVOKE_COMPLETION

    ln -sf $invoke_completion $custom_dir/$INVOKE_COMPLETION

    if [ -x "$(command -v bat)" ]; then
        readonly local themes_dir=$(bat --config-dir)/themes
        readonly local bat_theme_name="Solarized (dark)"
        readonly local bat_theme="$bat_theme_name.tmTheme"
        mkdir -p $themes_dir
        local bat_theme_full_path="$(cd "$(dirname "$bat_theme")" && pwd)/$(basename "$bat_theme")"
        ln -sf $bat_theme_full_path $themes_dir/$bat_theme
        echo --theme="\"$bat_theme_name\"" > $(bat --config-file)
        echo "--paging=never" >> $(bat --config-file)
        bat cache --build
    fi
}

main
