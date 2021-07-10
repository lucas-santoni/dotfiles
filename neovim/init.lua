-- Variables for quick access to 'built-in' stuff
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local execute = vim.api.nvim_command

-- Packer package manager
execute 'packadd packer.nvim'
local packer = require('packer')

-- Install packages
-- Packer is inspired by use-package so package configuration can be defined
-- here too but I prefer to have the package configurations outside for now
packer.startup(function()
  use { 'wbthomason/packer.nvim', opt = true }
  use 'jiangmiao/auto-pairs'
  use 'folke/which-key.nvim'
  use 'hrsh7th/nvim-compe'
  use 'tpope/vim-commentary'
  use 'famiu/nvim-reload'
  use 'RRethy/nvim-base16'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
  }
end)

-- Variables for quick packages access
local telescope = require('telescope')
local reload = require('nvim-reload')
local compe = require('compe')
local wk = require('which-key')

-- Setup colorscheme
-- We could probably use a Lua function exposed by the package here but who
-- cares and that's what the documentation recommends anyways
cmd('set termguicolors')
cmd('colorscheme base16-default-dark')

-- Various Vim settings
opt.expandtab = true                  -- Use spaces instead of tabs
opt.hidden = true                     -- Enable background buffers
opt.ignorecase = true                 -- Ignore case
opt.scrolloff = 4                     -- Lines of context
opt.shiftround = true                 -- Round indent
opt.shiftwidth = 2                    -- Size of an indent
opt.sidescrolloff = 8                 -- Columns of context
opt.smartcase = true                  -- Do not ignore case with capitals
opt.smartindent = true                -- Insert indents automatically
opt.splitbelow = true                 -- Put new windows below current
opt.splitright = true                 -- Put new windows right of current
opt.tabstop = 2                       -- Number of spaces tabs count for
opt.termguicolors = true              -- True color support
opt.wrap = false                      -- Disable line wrap
-- opt.signcolumn = 'yes'                -- Disable line wrap

-- Telescope settings
telescope.setup({
  defaults = {
    color_devicons = false,
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = 'dropdown',
    },
    find_files = {
      theme = 'dropdown',
    }
  },
})

-- Helper function to call highlight
function hi(group, opts)
  local c = 'highlight ' .. group
  for k, v in pairs(opts) do
    c = c .. ' ' .. k .. '=' .. v
  end

  vim.cmd(c)
end

-- Change the character used as a vertical split
-- No clue how to do this in Lua
vim.cmd('set fillchars+=vert:\\|')

-- Make the vertical split less visible
hi('VertSplit', { guibg = 'NONE', guifg='#ff0000', ctermbg='NONE', ctermfg=6 })
-- hi('SignColumn', { guibg = 'NONE' })
-- hi('StatusLine', { guibg = '#cccccc' })
-- hi('StatusLineNC', { guibg = '#cccccc', guifg = '#bbbbbb' })

-- Configure netrw
g.netrw_banner = 0

-- To be converted
vim.cmd('set completeopt=menuone,noselect')
vim.cmd('set shortmess+=c')

-- Remap the default leader (;) to ' ' (space)
g.mapleader = ' '

wk.setup({
  icons = {
    breadcrumb = "»",
    separator = "➜ ",
    group = "+",
  },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 0, 0, 0, 0 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  show_help = true,
})

wk.register({
  ["<leader>"] = { "<cmd>Telescope buffers<cr>", "Buffer List" },
  ["n"] = { "<cmd>nohl<cr>", "No Highlight" },
  a = {
    name = "windows/buffer",
    h = { "<C-w>h", "Window Left" },
    j = { "<C-w>j", "Window Down" },
    k = { "<C-w>k", "Window Right" },
    l = { "<C-w>l", "Window Up" },
    n = { "<cmd>bnext<cr>", "Next Buffer" },
    p = { "<cmd>bprev<cr>", "Previous Buffer" },
    s = { "<cmd>split<cr>", "Split Horizontally" },
    v = { "<cmd>vsplit<cr>", "Split Vertically" },
    q = { "<cmd>close<cr>", "Close" },
  },
  f = {
    name = "find",
    b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  },
  m = {
    name = "misc",
    s = { "<cmd>source %<cr>", "Source current" },
  },
}, { prefix = "<leader>" })
