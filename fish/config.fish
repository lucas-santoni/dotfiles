# Get the aliases
source ~/.dotfiles/fish/aliases.fish

# Disable greeting
set fish_greeting

# Vim mode
fish_vi_key_bindings
function fish_mode_prompt
  # Disable the vim indicator
end

# Default editor is vim
set -g -x EDITOR vim

# Colored man
set -x -g LESS_TERMCAP_mb (printf "\033[01;31m")
set -x -g LESS_TERMCAP_md (printf "\033[01;31m")
set -x -g LESS_TERMCAP_me (printf "\033[0m")
set -x -g LESS_TERMCAP_se (printf "\033[0m")
set -x -g LESS_TERMCAP_so (printf "\033[01;31;33m")
set -x -g LESS_TERMCAP_ue (printf "\033[0m")
set -x -g LESS_TERMCAP_us (printf "\033[01;32m")
