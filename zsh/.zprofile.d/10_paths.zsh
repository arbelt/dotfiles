
if [[ -x "/usr/libexec/path_helper" ]]; then
    PATH=""
    MANPATH=""
    eval "$(/usr/libexec/path_helper -s)"
fi

typeset -gU cdpath fpath mailpath path

export GOPATH="${HOME}/go"

path=(
    "${HOME}/.local/bin"
    "${HOME}/.cargo/bin"
    "${GOPATH}/bin"
    /usr/local/{bin,sbin}
    $path
)
