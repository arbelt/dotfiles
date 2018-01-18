setopt autocd
setopt extendedglob

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt extended_history
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

autoload -Uz compinit && compinit -i
_comp_options+=(globdots)

autoload -Uz promptinit && promptinit

setopt null_glob
setopt unset

DIRSTACKSIZE=20
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups

setopt interactive_comments
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=008'
