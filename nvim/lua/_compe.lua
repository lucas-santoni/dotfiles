local compe = require('compe')

compe.setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  documentation = false;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    calc = false;
    ultisnips = false;
    luasnip = false;
  };
})
