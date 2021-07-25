local lspkind = require('lspkind')

lspkind.init({
  symbol_map = {
    Text = ' ',
    Method = 'ƒ ',
    Function = 'ƒ ',
    Constructor = 'ƒ ',
    Variable = ' ',
    Class = ' ',
    Interface = ' ',
    Module = ' ',
    Property = ' ',
    Unit = ' ',
    Keyword = ' ',
    Snippet = '﬌ ',
    Color = ' ',
    File = ' ',
    Folder = ' ',
    Enum = ' ',
    EnumMember = ' ',
    Value = ' ',
    Constant = ' ',
    Struct = ' '
  },
})
