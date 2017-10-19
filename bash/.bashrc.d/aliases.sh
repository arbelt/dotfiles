alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

# Alias ls to --color=auto if GNU
if ! ls -P >/dev/null 2>&1
then
    alias ls="ls --color=auto"
fi
