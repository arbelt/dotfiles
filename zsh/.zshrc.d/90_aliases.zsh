if command -v nvim >/dev/null; then
    alias vim=nvim
fi

if command -v exa >/dev/null; then
    alias ls='exa -F'
fi

alias l='ls -l'
alias la='ls -a'

alias gcm='git commit -m'
alias gdc='git diff --cached'
