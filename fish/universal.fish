# These are universal variables
# They are defined *everywhere* and preserved
# accross restarts so this file should only be sourced
# when it changes

# fzf commands
set -Ux FZF_DEFAULT_COMMAND  "rg --files --no-ignore-vcs --hidden"
set -Ux FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -Ux FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"

# Default editor
set -Ux EDITOR vim

# Also use vim to read man pages
# See "Edit 2" of this post:
# https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
set -Ux MANPAGER "/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Locales
set -Ux LC_CTYPE fr_FR.UTF-8
set -Ux LC_ALL fr_FR.UTF-8

# GOPATH
set -Ux GOPATH $HOME/Documents/go

# Bat
set -Ux BAT_THEME "base16"

# Environment
set -Ux PATH $GOPATH/bin $PATH
set -Ux PATH "/usr/local/bin" $PATH

# Disable venv display (handled by prompt)
set -Ux VIRTUAL_ENV_DISABLE_PROMPT 1

# Disable fish welcome message
set -Ux fish_greeting
