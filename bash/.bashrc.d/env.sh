export PAGER=less
export EDITOR=vim

export PATH="${HOME}/.local/bin:${PATH}"

if [[ -d "${HOME}/go" ]]
then
    export GOPATH="${HOME}/go"
    export PATH="${GOPATH}/bin:${PATH}"
fi
