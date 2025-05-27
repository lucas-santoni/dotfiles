local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- !! The order matters !!

require('utils')
require('colors')
require('options')

require('lazy').setup(require('plugins'))
require('hop').setup()
require('_base16')
require('_cmp')
require('_galaxyline')
require('_gitsigns')
require('_indent-blankline')
require('_nvim-autopairs')
require('nvim-reload')
require('_nvim-tree')
require('_telescope')
require('_which-key')

require('highlights')
