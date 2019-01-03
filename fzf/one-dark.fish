# Nord fzf colors

set -l color00 '#272B33'
set -l color01 '#5C6370'
set -l color02 '#E06C75'
set -l color03 '#E06C75'
set -l color04 '#98C379'
set -l color05 '#98C379'
set -l color06 '#D19A66'
set -l color07 '#D19A66'
set -l color08 '#61AFEF'
set -l color09 '#61AFEF'
set -l color0A '#C678DD'
set -l color0B '#C678DD'
set -l color0C '#56B6C2'
set -l color0D '#56B6C2'
set -l color0E '#ABB2BF'
set -l color0F '#FFFFFF'

set -U FZF_DEFAULT_OPTS "\
  --color=bg+:$color00,bg:$color00,spinner:$color0C,hl:$color0D \
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C \
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D \
  --no-height --no-reverse \
  "
