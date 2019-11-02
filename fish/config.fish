# Get the aliases
source $HOME/.dotfiles/fish/aliases.fish

# Get the functions
source $HOME/.dotfiles/fish/functions.fish

# Disable greeting
set fish_greeting

# Vi mode
fish_vi_key_bindings

# Disable valid path underline
set fish_color_valid_path

# Bindings
function fish_user_key_bindings
  # Still enable ctrl+f in Vim mode
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end

  # Get the default FZF functions and bindings
  fzf_key_bindings

  # Set the custom bindings
  bind -e \cr
  bind \ch fzf-history-widget
  bind -e \ct
  bind \cj fzf-file-widget
  bind -e \ec
  bind \ck fzf-cd-widget
end

# FZF commands
set -gx FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -gx FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"
# This does not work, bash seems to hang
# set -gx FZF_TMUX 1

# Default editor
set -gx EDITOR nvim

# Colored man
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;31;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

# Go main workspace
set -gx GOPATH $HOME/Documents/go

# Go binaries
set -gx PATH $GOPATH/bin $PATH

# Locales
set -gx LC_CTYPE fr_FR.UTF-8
set -gx LC_ALL fr_FR.UTF-8

# Bat
set -gx BAT_THEME "base16-default-dark"

# Non-Apple Ruby
set -gx PATH "/usr/local/opt/ruby/bin" $PATH

# Non-Apple Binutils
set -gx PATH "/usr/local/opt/binutils/bin" $PATH

# Rust
set -gx PATH "$HOME/.cargo/bin" $PATH

# Disable venv display (handled by prompt)
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Prompt
eval (starship init fish)
