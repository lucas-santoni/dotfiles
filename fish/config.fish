# Don't forget to put the aliases in conf.d/
# ln -s ~/.dotfiles/fish/abbreviations.fish ~/.config/fish/conf.d/

# And install the functions
# ln -s ~/.dotfiles/fish/functions/* ~/.config/fish/functions/
# (This command must be run again if new function files are created)

# Disable greeting
set fish_greeting

# Enable Vi mode
fish_vi_key_bindings

# Disable valid path underline
set fish_color_valid_path

# fzf commands
set -gx FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -gx FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"

# Default editor
set -gx EDITOR vim

# Locales
set -gx LC_CTYPE fr_FR.UTF-8
set -gx LC_ALL fr_FR.UTF-8

# GOPATH
set -gx GOPATH $HOME/Documents/go

# Bat
set -gx BAT_THEME "base16"

# Environment
set -gx PATH $GOPATH/bin $PATH
set -gx PATH "/usr/local/bin" $PATH

# Disable venv display (handled by prompt)
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
