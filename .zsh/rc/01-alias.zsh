################ Alias #################
# editor
export EDITOR='vim'
alias vi='vim'
alias lvim="vim -c \"normal '0\"" #open last edited file

# ls
LS_OPTIONS='--color=auto'
alias lr='ls $LS_OPTIONS -R' # recursive ls
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -a'
alias lg='ls $LS_OPTIONS | grep -i'
alias l='ls $LS_OPTIONS -al'
alias l.='ls -d .* $LS_OPTIONS'

# cd
cdl() { cd "$@" && pwd ; la; }
alias ..='cdl ..'
alias ...='cd ../..'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# history
alias h='history'
alias hg='history | grep -i'

# pacman
alias pacu='pacman -Syu'
alias pac='pacman -Si'
alias pacQi='pacman -Qi'
alias pacRs='pacman -Rs'
alias pacs='pacman -Ss'

# extract tarball
alias gz='tar zxvf'
alias bz2='tar jxvf'

#others
alias du='du -h'
alias df='df -h'
alias lsblk='lsblk -l -f'
alias c='clear'
