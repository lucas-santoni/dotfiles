# Gruvbox fzf colors

set -l color00 '#1d2021'
set -l color01 '#cc241d'
set -l color02 '#98971a'
set -l color03 '#d79921'
set -l color04 '#458588'
set -l color05 '#b16286'
set -l color06 '#689d6a'
set -l color07 '#a89984'
set -l color08 '#928374'
set -l color09 '#fb4934'
set -l color0A '#b8bb26'
set -l color0B '#fabd2f'
set -l color0C '#83a598'
set -l color0D '#d3869b'
set -l color0E '#8ec07c'
set -l color0F '#ebdbb2'

set -U FZF_DEFAULT_OPTS "\
  --color=bg+:$color00,bg:$color00,spinner:$color0C,hl:$color0D \
  --color=fg:$color07,header:$color0D,info:$color0A,pointer:$color0C \
  --color=marker:$color0C,fg+:$color07,prompt:$color0A,hl+:$color0D \
  --no-height --no-reverse \
  "
