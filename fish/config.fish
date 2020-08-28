# Get the aliases
source $HOME/.dotfiles/fish/abbreviations.fish

# Get the functions
source $HOME/.dotfiles/fish/functions/*.fish

# Disable greeting
set fish_greeting

# Enable Vi mode
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

  # bind -e \ec
  # bind \ch fzf-cd-widget

  if bind -M insert > /dev/null 2>&1
    bind -M insert \cr fzf-history-widget
    bind -M insert \ct fzf-file-widget
    bind -M insert \ch fzf-cd-widget
  end
end

# FZF commands
set -gx FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -gx FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"

# Default editor
set -gx EDITOR nvim

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
set -gx PATH "/usr/local/opt/ruby/bin" $PATH
set -gx PATH "/usr/local/opt/binutils/bin" $PATH

# Disable venv display (handled by prompt)
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Base 16
if status --is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

# Prompt
starship init fish | source
