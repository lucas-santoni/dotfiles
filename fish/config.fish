# Get the aliases
source $HOME/.dotfiles/fish/aliases.fish

# Get the functions
source $HOME/.dotfiles/fish/functions.fish

# Disable greeting
set fish_greeting

# Disable valid path underline
set fish_color_valid_path

# Vi mode
# With cursor shape disabled
# Mode is handled by prompt
function fish_mode_prompt; end

# Bindings !
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

  # Vim mode compatibility
  if bind -M insert > /dev/null 2>&1
    bind -M insert -e \cr
    bind -M insert \ch fzf-history-widget
    bind -M insert -e \ct
    bind -M insert \cj fzf-file-widget
    bind -M insert -e \ec
    bind -M insert \ck fzf-cd-widget
  end
end

# FZF configuration
set -gx FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -gx FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"
# set -gx FZF_TMUX 1

# Default editor is vim
set -gx EDITOR vim

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

# Personal infos
# Used in vim snippets
set -gx FULLNAME "Lucas Santoni"
set -gx EPITECH_LOGIN "lucas.santoni@epitech.eu"
set -gx EPITECH_PATH "$HOME/Documents/epitech"

# Locales
set -gx LC_CTYPE fr_FR.UTF-8
set -gx LC_ALL fr_FR.UTF-8

# Bat
set -gx BAT_THEME "Dracula"
