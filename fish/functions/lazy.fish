# This file contains functions that allows to lazy-load more
# stuff. I don't need all of this everytime I start a new shell
# so I prefer to load it on demand.

# Only the theme I currently use should be loaded everytime. All the other
# themes and the associated helper can be loaded on demand.
function lazy_base16
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end
