local gitsigns = require('gitsigns')

-- TODO Make it work nicely with the LSP errors
gitsigns.setup({
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsNr" },
    delete = { hl = "DiffDelete", text = "│", numhl = "GitSignsNr" },
    topdelete = { hl = "DiffDelete", text = "│", numhl = "GitSignsNr" },
    changedelete = { hl = "DiffChange", text = "│", numhl = "GitSignsNr" }
  },
  numhl = false,
  watch_index = {
    interval = 100
  },
  sign_priority = 5,
  status_formatter = nil
})
