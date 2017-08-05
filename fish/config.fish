# Get the aliases
source ~/.dotfiles/fish/aliases.fish

# Disable greeting
set fish_greeting

# Vim mode
fish_vi_key_bindings
function fish_default_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    set -l normal (set_color normal)
    set -l blue (set_color blue)
    set -l yellow (set_color yellow)
    set -l green (set_color green)

    switch $fish_bind_mode
      case default
        echo -sn $blue"N$normal "
      case insert
        echo -sn ""
      case visual
        echo -sn $yellow"V$normal "
      case replace_one
        echo -sn $green"R$normal "
    end
  end
end

# Default editor is vim
set -gx EDITOR vim

# Colored man
set -xg LESS_TERMCAP_mb (printf "\033[01;31m")
set -xg LESS_TERMCAP_md (printf "\033[01;31m")
set -xg LESS_TERMCAP_me (printf "\033[0m")
set -xg LESS_TERMCAP_se (printf "\033[0m")
set -xg LESS_TERMCAP_so (printf "\033[01;31;33m")
set -xg LESS_TERMCAP_ue (printf "\033[0m")
set -xg LESS_TERMCAP_us (printf "\033[01;32m")

# Personal infos
# Used in vim snippets
set -xg FULLNAME "Lucas Santoni"
set -xg EPITECH_LOGIN "lucas.santoni@epitech.eu"
