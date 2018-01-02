if type pyenv &>/dev/null; then
    local pyenv_shims="${PYENV_ROOT:-${HOME}/.pyenv}/shims"
    export path=("${pyenv_shims}" $path)
    function pyenv() {
        unset pyenv
        eval "$(command pyenv init - --no-rehash)"
        pyenv $@
    }
fi

if type rbenv &>/dev/null; then
    local rbenv_shims="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
    if [[ -d $rbenv_shims ]]; then
        export path=("${rbenv_shims}" $path)
    fi
    function rbenv() {
        unset rbenv
        eval "$(command rbenv init - --no-rehash)"
        rbenv $@
    }
fi
