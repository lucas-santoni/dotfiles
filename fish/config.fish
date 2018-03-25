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
function fish_vi_cursor; end
fish_vi_key_bindings

# Still enable ctrl+f in Vi mode
function fish_user_key_bindings
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end

  fzf_key_bindings
end

# FZF configuration
set -gx FZF_ALT_C_COMMAND "command find -L \
\$dir -mindepth 1 \\( \
-path \$dir'*/\\.*' \
-o -path ./Library \
-o -path ./Applications \
-o -fstype 'sysfs' \
-o -fstype 'devfs' \
-o -fstype 'devtmpfs' \\) -prune \
-o -type d -print 2> /dev/null | sed 's@^\./@@'"
set -gx FZF_CTRL_T_COMMAND 'ag --nocolor \
--ignore Library \
--ignore Applications \
--ignore Google\ Drive \
-g ""'
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '--no-height --no-reverse'

# Default editor is vim
set -gx EDITOR vim

# Set term variable
set -gx TERM xterm-256color

# Colored man
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;31;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

# Add Cargo to PATH
# TODO: Remove this
set -gx PATH $HOME/.cargo/bin $PATH

# Add Gems to PATH
# TODO: Remove this
set -gx PATH $HOME/.gem/ruby/2.4.0/bin $PATH

# Add scripts to PATH
set -gx PATH $HOME/.dotfiles/scripts $PATH

# Personal infos
# Used in vim snippets
set -gx FULLNAME "Lucas Santoni"
set -gx EPITECH_LOGIN "lucas.santoni@epitech.eu"
set -gx EPITECH_PATH "$HOME/Documents/epitech"

# Locales
set -gx LC_CTYPE fr_FR.UTF-8
set -gx LC_ALL fr_FR.UTF-8
