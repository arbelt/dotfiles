typeset -Ag __vg_activation_data

__vg_search_activation_root() {
    if [[ -n ${VIRTUALGO} && ${__vg_activation_data[last_virtualgo]} != ${VIRTUALGO} ]]; then
        activation_root=${PWD}
        while [[ ${activation_root} != "/" ]]; do
            if [[ -s "${activation_root}/.virtualgo" ]]; then
                __vg_activation_data[root]=${activation_root}
                __vg_activation_data[last_virtualgo]=${VIRTUALGO}
                return
            fi
            activation_root=${activation_root:h}
        done
    fi
    __vg_activation_data[last_virtualgo]=${VIRTUALGO}
}

__vg_auto_deactivate() {
    __vg_search_activation_root
    act_root=${__vg_activation_data[root]}
    if [[ -n ${act_root} ]]; then
        if [[ ${PWD}/ = ${act_root}/* ]]; then
            return 0
        else
            vg deactivate
            __vg_activation_data[root]=""
            __vg_activation_data[last_virtualgo]=""
        fi
    fi
}

command -v vg >/dev/null && eval "$(vg eval --shell zsh)" && chpwd_functions+=(__vg_auto_deactivate)
