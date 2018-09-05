_results_count=0
_eval_callback() {
    eval "${@[3]}"
    _results_count=$(( $_results_count + 1 ))
    if [[ ${_results_count} -eq 4 ]]; then 
        async_stop_worker _env_worker
        export path=($HOME/.local/bin $path)
    fi
}

if autoload -Uz async && async >/dev/null 2>&1; then
    async_start_worker _env_worker
    async_register_callback _env_worker _eval_callback
    async_job _env_worker command pyenv init - --no-rehash
    async_job _env_worker command pyenv virtualenv-init -
    async_job _env_worker command rbenv init - --no-rehash
    async_job _env_worker command nodenv init - --no-rehash
    if [[ -s "${HOME}/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh" ]]; then
        source "${HOME}/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh"
    fi
    return
fi




if type pyenv &>/dev/null; then
    local pyenv_shims="${PYENV_ROOT:-${HOME}/.pyenv}/shims"
    export path=("${pyenv_shims}" $path)
    typeset -gf pyenv
    local pyenv_path="$(whence -p pyenv)"
    if [[ $pyenv_path = /usr/local/bin/pyenv ]]; then
        local completions="/usr/local/share/zsh/site-functions/pyenv.zsh"
        [[ -s $completions ]] && source "${completions}"
    fi
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

if command -v nodenv >/dev/null; then
    local nodenv_shims="${NODENV_ROOT:-${HOME}/.nodenv}/shims"
    export path=("${nodenv_shims}" $path)
    function nodenv() {
        unset nodenv
        eval "$(command nodenv init - --no-rehash)"
        nodenv $@
    }
fi

# ensure that ~/.local/bin comes before shims in path
export path=(~/.local/bin $path)

if [[ -s "${HOME}/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh" ]]; then
    source "${HOME}/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh"
fi
