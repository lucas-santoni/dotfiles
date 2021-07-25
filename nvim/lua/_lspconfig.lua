local lsp = require('lspconfig')

-- Enabled a bunch of servers
-- TODO Use a plugin that download/enable them by default?
lsp.gopls.setup({})
lsp.tsserver.setup({})
