if command -v nvim >/dev/null; then
    alias vim=nvim
fi

if command -v exa >/dev/null; then
    alias ls='exa -F'
fi

alias l='ls -l'
alias la='ls -a'

alias gd='git diff'

alias gb='git branch'
alias gba='git branch -a'
alias gc!='git commit -v --amend'
alias gcm='git commit -v -m'
alias gdc='git diff --cached'
alias ga='git add'
alias gau='git add -u'
alias gco='git checkout'
alias gf='git fetch'
alias gfa='git fetch --all --prune'

alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'

alias gst='git status'
alias gsb='git status -sb'

abbreviations+=(
    gau
    gst
    gsb
    gd
    glo
)

alias dh='dirs -v'

alias R='R --no-save'
