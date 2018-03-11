# Better completion
bind "set show-all-if-ambiguous on"
bind "TAB:menu-complete"

# Vim mode enabled in .inputrc
# Enable clear shortcut
bind -m vi-insert "\C-l":clear-screen

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Enable history expansion with space
# E.g: typing !!<space> will replace the !! with last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Enable incremental history search with up/down arrows
# (also Readline goodness)
# Learn more about this here:
# http://codeinthehole.com/writing/the-most-important-command-line-tip-
# incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Prepend cd to directory names automatically
# Correct spelling errors during tab-completion
# Correct spelling errors in arguments supplied to cd
shopt -s autocd
shopt -s dirspell
shopt -s cdspell

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it
# regardless of the directory you're in
shopt -s cdable_vars

# Bookmarks
export dots="$HOME/.dotfiles"
export epi="$HOME/Documents/epitech"
export hub="$HOME/Documents/hub"
