function get_flutter
  set -gx PATH "$HOME/Documents/flutter/flutter/bin" $PATH
end

function get_rust
  set -gx PATH "$HOME/.cargo/bin" $PATH
end

# Actually, it is even smarter not to source this file
# at all and simply do
# ln -s ~/.config/base16-shell/profile_helper.fish ~/.config/fish/conf.d/
# function get_base16
#   set BASE16_SHELL "$HOME/.config/base16-shell/"
#   source "$BASE16_SHELL/profile_helper.fish"
# end
