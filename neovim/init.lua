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

-- Setup colorscheme
-- We could probably use a Lua function exposed by the package here but who
-- cares and that's what the documentation recommends anyways
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
opt.signcolumn = 'yes'                -- Disable line wrap

-- Remap the default leader (;) to ' ' (space)
g.mapleader = ' '

-- Helper to define a new mapping
-- local function map(mode, lhs, rhs, opts)
--   local options = {noremap = true}
--   if opts then options = vim.tbl_extend('force', options, opts) end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

-- Helper to define a new mapping with leader
-- local function mapl(mode, lhs, rhs, opts)
--   map(mode, '<leader>' .. lhs, rhs, opts)
-- end

-- Helper to define a new mapping with leader, and a prefix
-- local function maplp(mode, p, lhs, rhs, opts)
--   map(mode, '<leader>' .. p .. lhs, rhs, opts)
-- end

-- Top mappings, no rules here
-- mapl('n', '<leader>', '<cmd>:Telescope buffers<cr>')
-- mapl('n', 'q', '<cmd>:close<cr>')

-- Save mappings
-- local save_prefix = 's'
-- maplp('n', save_prefix, 's',  '<cmd>:w<cr>')
-- maplp('n', save_prefix, 'a', '<cmd>:wa<cr>')
-- maplp('n', save_prefix, 'q', '<cmd>:wqa<cr>')

-- Buffer mappings
-- local buffer_prefix = 'b'
-- maplp('n', buffer_prefix, 'n', '<cmd>:bnext<cr>')
-- maplp('n', buffer_prefix, 'p', '<cmd>:bprev<cr>')

-- Split mappings
-- local split_prefix = 'a'
-- maplp('n', split_prefix, 'x', '<cmd>:split<cr>')
-- maplp('n', split_prefix, 'v', '<cmd>:vsplit<cr>')
-- maplp('n', split_prefix, 'a', '<cmd>:vsplit<cr>')
-- maplp('n', split_prefix, 'q', '<cmd>:close<cr>')
-- maplp('n', split_prefix, 'h', '<C-w>h')
-- maplp('n', split_prefix, 'j', '<C-w>j')
-- maplp('n', split_prefix, 'k', '<C-w>k')
-- maplp('n', split_prefix, 'l', '<C-w>l')

-- Miscellaneous mappings
-- local misc_prefix = 'm'
-- maplp('n', misc_prefix, 'n', '<cmd>:nohl<cr>')
-- maplp('n', misc_prefix, 's', '<cmd>:source %<cr>')
-- maplp('n', misc_prefix, 'r', '<cmd>:Reload<cr>')
-- maplp('n', misc_prefix, 'R', '<cmd>:Restart<cr>')
-- maplp('n', misc_prefix, 'q', '<cmd>:q<cr>')
-- maplp('n', misc_prefix, 'Q', '<cmd>:qa<cr>')

-- Telescope mappings
-- local telescope_mapping = 'f'
-- maplp('n', telescope_mapping, 'f', '<cmd>:Telescope find_files<cr>')
-- maplp('n', telescope_mapping, 'F', '<cmd>:Telescope file_browser<cr>')
-- maplp('n', telescope_mapping, 'b', '<cmd>:Telescope buffers<cr>')
-- maplp('n', telescope_mapping, 'g', '<cmd>:Telescope live_grep<cr>')

-- Telescope settings
telescope.setup {
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
}

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
-- hi('VertSplit', { guibg = 'NONE', guifg='NONE' })
-- hi('SignColumn', { guibg = 'NONE' })
-- hi('StatusLine', { guibg = '#cccccc' })
-- hi('StatusLineNC', { guibg = '#cccccc', guifg = '#bbbbbb' })

-- Configure netrw
g.netrw_banner = 0

-- To be converted
vim.cmd('set completeopt=menuone,noselect')
vim.cmd('set shortmess+=c')
