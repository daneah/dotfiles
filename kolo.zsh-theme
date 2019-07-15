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
%{$(iterm2_prompt_mark)%}$(env_info)$(aws_vault_info)$(virtualenv_info)$(formatted_location_info)%B%F{red}$(gemset_info)$(kubernetes_context)%B%F{green}${vcs_info_msg_0_}%{$reset_color%}
%(?..%B%F{red})%(2L.%L.)%(!.#.$)%{$reset_color%} '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

function formatted_location_info(){
    echo '%B%F{green}%n %B%F{yellow}at %B%F{magenta}%~ %B%F{yellow}on %B%F{blue}%M'
}

function kubernetes_context(){
    if type "kubectl" > /dev/null; then
        local k8s_context=$(kubectl config current-context)
        echo '%B%F{033} ⎈' $k8s_context
    fi
}

function aws_vault_info(){
    if [ $AWS_VAULT ]; then
        echo "%B%F{208}[$AWS_VAULT] "
    fi
}

function virtualenv_info(){
    local -r current_env=$(pyenv_prompt_info)
    if [ $current_env ]; then
        echo '%B%F{white}('$current_env') '
    else
        echo '%B%F{white}('$(basename $VIRTUAL_ENV)') '
    fi
}

function gemset_info(){
    local gemset=$(rvm-prompt g 2&> /dev/null)
    if [ -n "$gemset" ]; then
        gemset=${gemset#"@"}
        echo " ♦ $gemset"
    fi
}

function env_info(){
    readonly local env=$(get_env 2&> /dev/null)
    if [ -n "$env" ]; then
        echo "%B%F{white}${env} "
    fi
}

autoload -U zmv

setopt no_hist_verify
setopt extendedglob
