local base16 = require('base16')

local enable_256_color_space = true

local theme_array = {
  background   ; background_l ; background_ll ; background_lll  ;
  foreground_d ; foreground   ; foreground_l  ; white           ;
  red          ; orange       ; yellow        ; green           ;
  teal         ; blue         ; pink          ; brown           ;
}

-- Remove leading `#` characters
local theme_array_clean = map(theme_array, function(x) return x:sub(2) end)
local theme = base16.theme_from_array(theme_array_clean)
base16(theme, enable_256_color_space)
