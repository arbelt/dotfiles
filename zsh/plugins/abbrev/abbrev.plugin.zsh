# expand aliases that are found in the `abbreviations` array

typeset -ag abbreviations

globalias() {
    local last_word=${${(Az)LBUFFER}[-1]}
    if [[ -n "${abbreviations[(r)${last_word}]}" ]]; then
        zle _expand_alias
    fi
    zle expand-word
    zle self-insert
}

zle -N globalias

bindkey -M emacs " " globalias
bindkey -M viins " " globalias

bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

bindkey -M isearch " " magic-space
