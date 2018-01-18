# Exit if interactive
case $- in
    *i*) 
        ;;
    *) 
        return
        ;;
esac


## GENERAL

# Prevent redirection from overwriting file
# Use `>|` to force redirection
set -o noclobber

# Enable history expansion with space
# E.g., typing !!<space> will replace !! with last command
bind Space:magic-space

# Enable recursive globbing (** recurses directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing for pathname expansion
shopt -s nocaseglob

# Allow additional globbing patterns
shopt -s extglob

# Check window size after each command
shopt -s checkwinsize


## TAB-COMPLETION (Readline bindings)

# File completion case-insensitive
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab
bind "set show-all-if-ambiguous on"

# Add trailing slash when autocompleting symlinked directories
bind "set mark-symlinked-directories on"


## HISTORY DEFAULTS

# Append to history file, don't overwrite
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Bigger history
HISTSIZE=1000000
HISTFILESIZE=1000000000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[  ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T'

# http://codeinthehole.com/tips/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## DIRECTORY NAVIGATION

# Allow cd with bare names
shopt -s autocd 2>/dev/null

# Correct spelling errors during tab
shopt -s dirspell 2>/dev/null

# Correct spelling errors in arguments to cd
shopt -s cdspell 2> /dev/null

# Allows bookmarking
# Define a variable containing a path and be able to cd into it
shopt -s cdable_vars


## MISC

# Turn on colors
export CLICOLOR=1

# Make less more friendly no non-text files
# (from default Ubuntu bashrc)
if [ -x /usr/bin/lesspipe ]
then
    eval "$(SHELL=/bin/sh lesspipe)"
fi


bashrcd=~/.bashrc.d

[[ -s "${bashrcd}/env.sh" ]] && source "${bashrcd}/env.sh"

for f in ${bashrcd}/!(env).sh
do
    source "$f"
done

# Use liquidprompt
# https://github.com/nojhan/liquidprompt
if [[ -s "${HOME}/.liquidprompt/liquidprompt" ]]
then
    source "${HOME}/.liquidprompt/liquidprompt"
fi


command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"

source ~/.bashrc.local 2>/dev/null || true
