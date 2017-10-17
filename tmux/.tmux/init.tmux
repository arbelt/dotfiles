#!/usr/bin/env bash

function prefix {
    tmux show-option -gv prefix
}

if [[ $(prefix) = C-b ]]
then
    tmux unbind-key "C-b"
    tmux set-option -g prefix "C-a"
    tmux bind-key "C-a" send-prefix
fi

