local gitsigns = require('gitsigns')

gitsigns.setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "│" },
    topdelete = { text = "│" },
    changedelete = { text = "│" }
  },
  numhl = false,
  watch_gitdir = {
    interval = 100
  },
  sign_priority = 5,
  status_formatter = nil
})
