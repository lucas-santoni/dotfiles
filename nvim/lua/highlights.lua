-- Helper function to call highlight
function hi(group, opts)
  local c = 'highlight! ' .. group
  for k, v in pairs(opts) do
    c = c .. ' ' .. k .. '=' .. v
  end

  vim.cmd(c)
end

-- No background allows for a _thiner_ vertical split
hi('WinSeparator', { guibg = 'NONE', guifg = background_ll })

-- By default it uses a lighter background
hi('SignColumn', { guibg = 'NONE' })

-- Colors when searching with /
hi('Search', { guibg = background_ll, guifg = foreground_d })
hi('IncSearch', { guibg = orange, guifg = background})

-- We don't want to highglight the current line but we do want to make the
-- current light number brighter.
hi('LineNR', { guibg = 'NONE', guifg = background_l })
hi('CursorLine', { guibg = 'NONE', guifg = 'NONE' })
hi('CursorLineNR', { guibg = 'NONE', guifg = background_lll })

-- Ident sign
hi('IndentBlanklineChar', { guibg = 'NONE', guifg = background_l })

-- End of line, tab
hi('NonText', { guibg = 'NONE', guifg = background_l })

-- Telescope colors, check
-- https://github.com/nvim-telescope/telescope.nvim#how-to-change-telescope-highlights-group
hi('TelescopeSelection', { guibg = 'NONE', guifg = foreground })
hi('TelescopeSelectionCaret', { guibg = 'NONE', guifg = red })
hi('TelescopeNormal', { guibg = background, guifg = foreground })
hi('TelescopeBorder', { guifg = background_lll })
hi('TelescopePromptBorder', { guifg = background_lll })
hi('TelescopeResultsBorder', { guifg = background_lll })
hi('TelescopePreviewBorder', { guifg = background_lll })
hi('TelescopeMatching', { guibg = background_ll, guifg = foreground_d })
hi('TelescopePromptPrefix', { guifg = red })

-- Hop colors, check :help hop-highlights
hi('HopUnmatched', { guibg = background, guifg = background_ll })
hi('HopNextKey', { guibg = background, guifg = red })
hi('HopNextKey1', { guibg = background, guifg = red })
hi('HopNextKey2', { guibg = background, guifg = red })

-- Avoid unthemed character in vertical split
-- https://github.com/vim-airline/vim-airline-themes/issues/48
hi('StatusLine', { guibg = background_l })
hi('StatusLineNC', { guibg = background_l })

-- Make the indentation quiter
hi('NvimTreeIndentMarker', { guibg = 'NONE', guifg = background_l })

-- GitSigns colors
hi('GitSignsAdd', { guibg = 'NONE' , guifg = green })
hi('GitSignsChange', { guibg = 'NONE' , guifg = orange })
hi('GitSignsDelete', { guibg = 'NONE' , guifg = red })

-- WhichKey
hi('WhichKey',          { guibg = background_l, guifg = orange })
hi('WhichKeyBorder',    { guibg = background_l, guifg = background_lll })
hi('WhichKeyDesc',      { guibg = background_l, guifg = green })
hi('WhichKeyGroup',     { guibg = background_l, guifg = teal })
hi('WhichKeyIcon',      { guibg = background_l, guifg = foreground_l })
hi('WhichKeyIconAzure', { guibg = background_l, guifg = orange })
hi('WhichKeyIconBlue',  { guibg = background_l, guifg = blue })
hi('WhichKeyIconCyan',  { guibg = background_l, guifg = teal })
hi('WhichKeyIconGreen', { guibg = background_l, guifg = green })
hi('WhichKeyIconGrey',  { guibg = background_l, guifg = foreground })
hi('WhichKeyIconOrange',{ guibg = background_l, guifg = orange })
hi('WhichKeyIconPurple',{ guibg = background_l, guifg = pink })
hi('WhichKeyIconRed',   { guibg = background_l, guifg = red })
hi('WhichKeyIconYellow',{ guibg = background_l, guifg = yellow })
hi('WhichKeyNormal',    { guibg = background_l, guifg = foreground })
hi('WhichKeySeparator', { guibg = background_l, guifg = background_lll })
hi('WhichKeyTitle',     { guibg = background_l, guifg = foreground_l })
hi('WhichKeyValue',     { guibg = background_l, guifg = foreground_l })

-- nvim-cmp highlight groups
hi('CmpItemAbbr',               { guibg = background_l, guifg = foreground })
hi('CmpItemAbbrDeprecated',     { guibg = background_l, guifg = brown, gui = 'strikethrough' })
hi('CmpItemAbbrMatch',          { guibg = background_l, guifg = blue })
hi('CmpItemAbbrMatchFuzzy',     { guibg = background_l, guifg = blue })
hi('CmpItemKind',               { guibg = background_l, guifg = background_ll })
hi('CmpItemMenu',               { guibg = background_l, guifg = teal })
hi('CmpItemKindVariable',       { guibg = background_l, guifg = orange })
hi('CmpItemKindInterface',      { guibg = background_l, guifg = yellow })
hi('CmpItemKindText',           { guibg = background_l, guifg = foreground_d })
hi('CmpItemKindFunction',       { guibg = background_l, guifg = pink })
hi('CmpItemKindMethod',         { guibg = background_l, guifg = pink })
hi('CmpItemKindConstructor',    { guibg = background_l, guifg = pink })
hi('CmpItemKindField',          { guibg = background_l, guifg = teal })
hi('CmpItemKindProperty',       { guibg = background_l, guifg = teal })
hi('CmpItemKindEnum',           { guibg = background_l, guifg = yellow })
hi('CmpItemKindKeyword',        { guibg = background_l, guifg = red })
hi('CmpItemKindConstant',       { guibg = background_l, guifg = orange })
hi('CmpItemKindModule',         { guibg = background_l, guifg = teal })
hi('CmpItemKindStruct',         { guibg = background_l, guifg = teal })
hi('CmpItemKindClass',          { guibg = background_l, guifg = yellow })
hi('CmpItemKindEvent',          { guibg = background_l, guifg = orange })
hi('CmpItemKindOperator',       { guibg = background_l, guifg = orange })
hi('CmpItemKindTypeParameter',  { guibg = background_l, guifg = pink })
hi('PmenuSel',                  { guibg = background_ll, guifg = foreground })
