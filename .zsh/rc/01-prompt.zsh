setopt PROMPT_SUBST

__prompt_prefix(){
    _color B yellow '>>'
    print -n ' '
    _color B green '%n@%m'
    print -n ' '
    _color B magenta '%~ '
}

__prompt_postfix(){
    _color B white '%#'
    print -n ' '
}

precmd(){
    local GIT_PS1_SHOWCOLORHINTS=true
    local GIT_PS1_SHOWDIRTYSTATE=true
    # local GIT_PS1_SHOWUPSTREAM="auto"
    # local GIT_PS1_DESCRIBE_STYLE="describe"
    __git_ps1 "$(__prompt_prefix)" "$(__prompt_postfix)" "%s "
} && precmd
