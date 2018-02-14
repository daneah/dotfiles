autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt prompt_subst
PROMPT='
%{$(iterm2_prompt_mark)%}%B%F{white}$(env_info)$(virtualenv_info)$(formatted_location_info)%B%F{red}$(gemset_info)%B%F{green}${vcs_info_msg_0_}%{$reset_color%}
%(?..%B%F{red})%(2L.%L.)%(!.#.$)%{$reset_color%} '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

function virtualenv_info(){
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function formatted_location_info(){
    echo '%B%F{green}%n %B%F{yellow}at %B%F{magenta}%~ %B%F{yellow}on %B%F{blue}%M'
}

function gemset_info(){
    readonly local gemset=$(rvm-prompt g 2&> /dev/null)
    if [ -n "$gemset" ]; then
        echo " ♦️ $gemset"
    fi
}

function env_info(){
    readonly local env=$(get_env 2&> /dev/null)
    if [ -n "$env" ]; then
        echo "${env} "
    fi
}

autoload -U zmv

setopt no_hist_verify
setopt extendedglob
