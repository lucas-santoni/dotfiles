# Get the aliases
source ~/.dotfiles/fish/aliases.fish

# Get the functions
source ~/.dotfiles/fish/functions.fish

# Disable greeting
set fish_greeting

# Vi mode
# With cursor shape disabled
function fish_vi_cursor; end
fish_vi_key_bindings

# Default editor is vim
set -gx EDITOR vim

# Set term variable
set -gx TERM xterm-256color

# Colored man
set -xg LESS_TERMCAP_mb (printf "\033[01;31m")
set -xg LESS_TERMCAP_md (printf "\033[01;31m")
set -xg LESS_TERMCAP_me (printf "\033[0m")
set -xg LESS_TERMCAP_se (printf "\033[0m")
set -xg LESS_TERMCAP_so (printf "\033[01;31;33m")
set -xg LESS_TERMCAP_ue (printf "\033[0m")
set -xg LESS_TERMCAP_us (printf "\033[01;32m")

# Add Cargo to PATH
set -gx PATH $HOME/.cargo/bin $PATH

# Personal infos
# Used in vim snippets
set -xg FULLNAME "Lucas Santoni"
set -xg EPITECH_LOGIN "lucas.santoni@epitech.eu"
