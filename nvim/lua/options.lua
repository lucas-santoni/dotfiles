-- I guess just use :help <something> when in doubt
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.hidden = true
vim.opt.showcmd = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.number = false
vim.opt.cursorline = true
vim.opt.completeopt = 'menuone,noselect'
vim.opt.pumheight = 10
vim.opt.inccommand = 'nosplit'
vim.opt.list = true
vim.opt.listchars = "eol:↵,tab:↣  "
vim.opt.shortmess = "filnxtToOfc"

-- Change the character used as a vertical split
-- TODO Convert to Lua one day
vim.cmd('set fillchars+=vert:\\|')

-- Don't show netrw help banner
vim.g.netrw_banner = 0

-- Remap leader to `space`
vim.g.mapleader = ' '

-- Mode is already displayed in the statusline so we can hide it here.
-- TODO Convert to Lua one day...
vim.cmd('set noshowmode')
