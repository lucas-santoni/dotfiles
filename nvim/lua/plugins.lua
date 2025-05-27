return {
  -- Plugin manager (lazy manages itself)
  { 'folke/lazy.nvim', version = '*' },

  -- Reload support
  { 'famiu/nvim-reload' },

  -- Which-key
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  },

  -- Statusline (according to ChatGPT I should migrate to a maintained one like
  -- lualine - smart guy)
  { 'glepnir/galaxyline.nvim' },

  -- Completion engine
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-vsnip' },

  -- Snippet engine
  { 'hrsh7th/vim-vsnip' },

  -- File tree
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
    end,
  },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- Indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup()
    end,
  },

  -- Colorscheme support (base16)
  { 'norcalli/nvim-base16.lua' },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup()
    end,
  },

  -- Motion plugin
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup()
    end,
  },

  -- Commenting
  { 'tpope/vim-commentary' },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },
}


-- vim.api.nvim_command('packadd packer.nvim')
-- local packer = require('packer')

-- packer.startup(function()
--   use({ 'wbthomason/packer.nvim', opt = true })

--   use('famiu/nvim-reload')
--   use('folke/which-key.nvim')
--   use('glepnir/galaxyline.nvim')

--   use('hrsh7th/cmp-buffer')
--   use('hrsh7th/cmp-vsnip')
--   use('hrsh7th/vim-vsnip')
--   use('hrsh7th/nvim-cmp')

--   use('kyazdani42/nvim-tree.lua')
--   use {
--     'lewis6991/gitsigns.nvim',
--     requires = {
--       'nvim-lua/plenary.nvim'
--     }
--   }
--   use('lukas-reineke/indent-blankline.nvim')
--   use('norcalli/nvim-base16.lua')
--   use({
--     'nvim-telescope/telescope.nvim',
--     requires = {
--       { 'nvim-lua/popup.nvim' },
--       { 'nvim-lua/plenary.nvim' }
--     }
--   })
--   use('phaazon/hop.nvim')
--   use('tpope/vim-commentary')
--   use('windwp/nvim-autopairs')
-- end)
