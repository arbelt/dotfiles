bindkey -e

if command -v antibody >/dev/null; then
    source <(antibody init)
    antibody bundle < ~/.zsh_plugins.txt
fi

for f in "${HOME}/.zshrc.d/"*.zsh; do
    source "$f"
done

command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"

if [[ -s "${HOME}/.fzf.zsh" ]]; then
    source "${HOME}/.fzf.zsh"
fi

