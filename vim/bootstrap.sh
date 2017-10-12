#!/usr/bin/env bash

set -e

DEIN_GIT=https://github.com/Shougo/dein.vim

DEIN_REPO_DIR="${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim"

if [[ ! -d $DEIN_REPO_DIR ]] 
then
    printf "Dein repo does not exist. Cloning into %s...\n" "${DEIN_REPO_DIR}" >&2
    git clone "${DEIN_GIT}" "${DEIN_REPO_DIR}"
else
    printf "Existing Dein found.\n" >&2
fi

