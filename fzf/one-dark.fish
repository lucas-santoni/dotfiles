# Nord fzf colors

set -l color00 '#282C34'
set -l color01 '#E06C75'
set -l color02 '#98C379'
set -l color03 '#E5C07B'
set -l color04 '#61AFEF'
set -l color05 '#C678DD'
set -l color06 '#56B6C2'
set -l color07 '#ABB2BF'
set -l color08 '#3E4452'
set -l color09 '#BE5046'
set -l color0A '#98C379'
set -l color0B '#D19A66'
set -l color0C '#61AFEF'
set -l color0D '#C678DD'
set -l color0E '#56B6C2'
set -l color0F '#5C6370'

set -U FZF_DEFAULT_OPTS "\
  --color=bg+:$color00,bg:$color00,spinner:$color0C,hl:$color0D \
  --color=fg:$color07,header:$color0D,info:$color0A,pointer:$color0C \
  --color=marker:$color0C,fg+:$color07,prompt:$color0A,hl+:$color0D \
  --no-height --no-reverse \
  "
