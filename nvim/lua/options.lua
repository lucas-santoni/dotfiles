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
vim.opt.laststatus = 3
vim.opt.fillchars = { vert = '│' }
vim.g.netrw_banner = 0

-- This configuration relies on the spacebar a lot
vim.g.mapleader = ' '

-- Mode is already displayed by the statusline plugin
vim.cmd('set noshowmode')
