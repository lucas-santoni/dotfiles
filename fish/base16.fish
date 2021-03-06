#!/usr/bin/env fish

# This file is a patched version of the profile_helper.fish script that is
# distributed with https://github.com/chriskempson/base16-shell
# It only loads the currently selected theme to allow shorter startup times
# Use lazy_base16 to load the original profile helper (see lazy.fish)

if test -e ~/.base16_theme
  eval sh '"'(realpath ~/.base16_theme)'"'
end
