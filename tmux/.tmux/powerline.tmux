#!/usr/bin/env bash

POWERLINE_ROOT=$(tmux show-option -gv '@powerline_root')

function powerline_daemon_running {
    pgrep 'python3?' | xargs ps -o command -p | grep -q powerline-daemon
}

if [[ -d "${POWERLINE_ROOT}" ]]
then
    if ! powerline_daemon_running; then
        command -v powerline-daemon >/dev/null && powerline-daemon -q
    fi
    tmux source "${POWERLINE_ROOT}/powerline/bindings/tmux/powerline.conf"
fi

