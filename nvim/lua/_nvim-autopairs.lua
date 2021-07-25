local autopairs = require('nvim-autopairs')

autopairs.setup({
  disable_filetype = { 'TelescopePrompt' },
})

-- Not sure what this does but must be cool when also using compe
require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true
})
