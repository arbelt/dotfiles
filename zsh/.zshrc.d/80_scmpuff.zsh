
if command -v scmpuff >/dev/null; then
    eval "$(scmpuff init --aliases=false -s)"
    alias gs='scmpuff_status'
fi
