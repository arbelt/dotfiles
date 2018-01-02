bindkey -e

if command -v antibody >/dev/null; then
    source <(antibody init)
    antibody bundle < ~/.zsh_plugins.txt
fi

for f in "${HOME}/.zshrc.d/"*.zsh; do
    source "$f"
done

command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"

source "${HOME}/.fzf.zsh" 2>/dev/null || true

source "${HOME}/.zshrc.local" 2>/dev/null || true
