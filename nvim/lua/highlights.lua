-- Helper function to call highlight
function hi(group, opts)
  local c = 'highlight! ' .. group
  for k, v in pairs(opts) do
    c = c .. ' ' .. k .. '=' .. v
  end

  vim.cmd(c)
end

-- No background allows for a _thiner_ vertical split
hi('VertSplit', { guibg = 'NONE' })

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

-- LSP gutter signs colors
hi('LspDiagnosticsDefaultError', { guibg = 'NONE', guifg = red })
hi('LspDiagnosticsDefaultWarning', { guibg = 'NONE', guifg = orange })
hi('LspDiagnosticsDefaultInformation', { guibg = 'NONE', guifg = blue })
hi('LspDiagnosticsDefaultHint', { guibg = 'NONE', guifg = blue })

-- Trouble colors
hi('TroubleCount', { guibg = background_lll, guifg = background })
hi('TroubleFoldIcon', { guibg = 'NONE', guifg = background_ll })
hi('TroubleIndent', { guibg = 'NONE', guifg = background_ll })
hi('TroubleLocation', { guibg = 'NONE', guifg = background_lll })
hi('TroubleSource', { guibg = 'NONE', guifg = background_lll })

-- Ident sign
hi('IndentBlanklineChar', { guibg = 'NONE', guifg = background_l })

-- End of line, tab
hi('NonText', { guibg = 'NONE', guifg = background_l })

-- Telescope colors, check
-- https://github.com/nvim-telescope/telescope.nvim#how-to-change-telescope-highlights-group
hi('TelescopeSelection', { guibg = 'NONE', guifg = foreground })
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

-- When in a LSP hover, the TypeScript parenthesis have a wrong background
vim.cmd('highlight link typescriptParens typescript2')

-- Make the main text darker, so that it contrasts with the function definition
hi('lsp_markdown3', { guifg = foreground_d })

-- Avoid unthemed character in vertical split
-- https://github.com/vim-airline/vim-airline-themes/issues/48
hi('StatusLine', { guibg = background_l })
hi('StatusLineNC', { guibg = background_l })
