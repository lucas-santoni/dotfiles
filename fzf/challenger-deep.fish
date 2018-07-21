# Challenger Deep fzf colors

set -l color00 '#1b182c'
set -l color01 '#ff8080'
set -l color02 '#95ffa4'
set -l color03 '#ffe9aa'
set -l color04 '#91ddff'
set -l color05 '#c991e1'
set -l color06 '#aaffe4'
set -l color07 '#cbe3e7'
set -l color08 '#100e23'
set -l color09 '#ff5458'
set -l color0A '#62d196'
set -l color0B '#ffb378'
set -l color0C '#65b2ff'
set -l color0D '#906cff'
set -l color0E '#63f2f1'
set -l color0F '#a6b3cc'

set -U FZF_DEFAULT_OPTS "\
  --color=bg+:$color00,bg:$color00,spinner:$color0C,hl:$color0D \
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C \
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D \
  --no-height --no-reverse \
  "
