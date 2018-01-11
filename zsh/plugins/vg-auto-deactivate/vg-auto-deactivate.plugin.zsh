typeset -g __vg_activation_root=""

__vg_set_activation_root() {
    if [[ -n ${__vg_activation_root} ]]; then
        if [[ ${PWD}/ = ${__vg_activation_root}/* ]]; then
            return 0
        else
            vg deactivate
            __vg_activation_root=""
        fi
    else
        if [[ -f "${PWD}/.virtualgo" ]]; then
            __vg_activation_root=${PWD}
        fi
    fi
}

chpwd_functions+=(__vg_set_activation_root)
