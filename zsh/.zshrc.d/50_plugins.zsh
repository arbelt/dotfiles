local _plugindir=${${(%):-%N}:A:h:h}/plugins

function() {
    setopt nullglob
    for plugin in ${plugins}
    do
        for f in "${_plugindir}/${plugin}"/*.plugin.zsh; do
            source "${f}"
        done
    done
}

unset _plugindir
