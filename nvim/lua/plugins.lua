vim.api.nvim_command('packadd packer.nvim')
local packer = require('packer')

packer.startup(function()
  use({ 'wbthomason/packer.nvim', opt = true })

  use('famiu/nvim-reload')
  use('folke/trouble.nvim')
  use('folke/which-key.nvim')
  use('glepnir/galaxyline.nvim')
  use('hrsh7th/nvim-compe')
  use('kyazdani42/nvim-tree.lua')
  use('kyazdani42/nvim-web-devicons')
  use('lukas-reineke/indent-blankline.nvim')
  use('neovim/nvim-lspconfig')
  use('norcalli/nvim-base16.lua')
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    }
  })
  use('onsails/lspkind-nvim')
  use('phaazon/hop.nvim')
  use('tpope/vim-commentary')
  use('windwp/nvim-autopairs')
end)
