autoload -U select-word-style
select-word-style bash

bindkey -e

if command -v antibody >/dev/null; then
    source <(antibody init)
    antibody bundle < ~/.zsh_plugins.txt
fi

for f in "${HOME}/.zshrc.d/"*.zsh; do
    source "$f"
done

command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"

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

typeset -ag abbreviations

abbreviations=(
    "ga"
    "gcm"
    "gco"
    "gdc"
)

globalias() {
    if [[ -n "${abbreviations[(r)${LBUFFER}]}" ]]; then
        zle _expand_alias
    fi
    zle expand-word
    zle self-insert
}

zle -N globalias

bindkey -M emacs " " globalias
bindkey -M viins " " globalias

bindkey -M isearch " " magic-space
