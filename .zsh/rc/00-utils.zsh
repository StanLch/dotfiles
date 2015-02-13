# Color a string
# @t: B for Bold, b for normal
# @c: color
# @ seg: string segment
_color(){
    local t f seg
    [[ -n $1 ]] && t="%$1" || t="%b"
    [[ -n $2 ]] && c="$fg[$2]" || c="$fg[default]"
    [[ -n $3 ]] && seg="$3" || return
    print -n "%{$t$c%}${seg}%{%b$color_reset%}"
}
