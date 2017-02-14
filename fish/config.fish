# Vim indicator
function fish_mode_prompt
  # Disable the vim indicator
end

# Term compatibility
set TERM xterm

# Default editor
set EDITOR vim

# Prompt colors
# Seoul 256
set dangerous_colors 3a3a3a 4e4e4e 626262 d0d0d0 d8af5f ffd787 d68787 d75f87 85add4 add4fb 5f865f 87af87

# Colored man
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;31;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

# fzf
set FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'
set FZF_CTRL_T_OPTS "--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
set FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"

# Private aliases
source ~/.private-dotfiles/private_aliases

# Normal aliases
source ~/.dotfiles/fish/aliases
