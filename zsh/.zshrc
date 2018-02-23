autoload -U select-word-style
select-word-style bash

bindkey -e

#autoload -U compinit && compinit

if command -v antibody >/dev/null; then
    source <(antibody init)
    antibody bundle < ~/.zsh_plugins.txt
fi

typeset -a plugins

plugins=(
    pyenv
    abbrev
    virtualgo
    git
)

abbreviations=(
    "ga"
    "gcm"
    "gco"
    "gdc"
    "gfa"
)

for f in "${HOME}/.zshrc.d/"*.zsh; do
    source "$f"
done

local has_fd=$(command -v fd)

if command -v fzf >/dev/null; then
    source "${HOME}/.fzf.zsh" 2>/dev/null || true
    if [[ -n "${has_fd}" ]]; then
        export FZF_DEFAULT_COMMAND='fd --type f'
        export FZF_ALT_C_COMMAND='fd --type d'
    fi
fi

source "${HOME}/.zshrc.local" 2>/dev/null || true

command -v fasd >/dev/null && eval "$(fasd --init auto)"
