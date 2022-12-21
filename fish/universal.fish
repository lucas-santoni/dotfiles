# These are universal variables
# They are defined _everywhere_ and preserved
# accross restarts so this file should only be sourced
# when it changes

# fzf commands
set -Ux FZF_DEFAULT_COMMAND  "rg --files --no-ignore-vcs --hidden"
set -Ux FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -Ux FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"

# Default editor: nvim
set -Ux EDITOR nvim

# Also use nvim to read man pages
# See "Edit 2" of this post:
# https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
set -Ux MANPAGER "/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Locales
set -Ux LOCALE fr_FR.UTF-8
set -Ux LC_CTYPE fr_FR.UTF-8
set -Ux LC_ALL fr_FR.UTF-8

# GOPATH
set -Ux GOPATH $HOME/Documents/go

# Bat
set -Ux BAT_THEME base16

# Disable venv display (handled by prompt)
set -Ux VIRTUAL_ENV_DISABLE_PROMPT 1

# Default NVM
set -Ux nvm_default_version lts

# Disable fish welcome message
set -U fish_greeting

# Disable fish underlining stuff
set -U fish_color_valid_path

# Base16 colors (dark)
set -U fish_color_normal normal
set -U fish_color_command a1b56c
set -U fish_color_quote f7ca88
set -U fish_color_redirection d8d8d8
set -U fish_color_end ba8baf
set -U fish_color_error ab4642
set -U fish_color_param d8d8d8
set -U fish_color_comment f7ca88
set -U fish_color_match 7cafc2
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 7cafc2
set -U fish_color_escape 86c1b9
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 585858
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel --reverse
set -U fish_pager_color_background
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D
set -U fish_pager_color_selected_background --background=brblack
set -U fish_pager_color_selected_prefix
set -U fish_pager_color_selected_completion
set -U fish_pager_color_selected_description
set -U fish_color_option
set -U fish_color_keyword
set -U fish_pager_color_secondary_prefix
set -U fish_pager_color_secondary_background
set -U fish_color_host_remote
set -U fish_pager_color_secondary_description
set -U fish_pager_color_secondary_completion
