-- Colors
local background =     '#181818'
local background_l =   '#282828'
local background_ll =  '#383838'
local background_lll = '#585858'
local foreground_d =   '#b8b8b8'
local foreground =     '#d8d8d8'
local foreground_l =   '#e8e8e8'
local white =          '#f8f8f8'
local red =            '#ab4642'
local orange =         '#dc9656'
local yellow =         '#f7ca88'
local green =          '#a1b56c'
local teal =           '#86c1b9'
local blue =           '#7cafc2'
local pink =           '#ba8baf'
local brown =          '#a16946'

-- Map utility
function map(arr, f)
  local res = {}

  for k, v in pairs(arr) do
    res[k] = f(v)
  end

  return res
end

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
  use({ 'wbthomason/packer.nvim', opt = true })
  use('kyazdani42/nvim-web-devicons')
  use('windwp/nvim-autopairs')
  use('folke/which-key.nvim')
  use('tpope/vim-commentary')
  use('norcalli/nvim-base16.lua')
  use('famiu/nvim-reload')
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
  })
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-compe')
  use('folke/trouble.nvim')
  use('onsails/lspkind-nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('glepnir/galaxyline.nvim')
  use('phaazon/hop.nvim')
  use('kyazdani42/nvim-tree.lua')
  use('ntpeters/vim-better-whitespace')
end)

-- Variables for quick packages access
local base16      = require('base16')
local telescope   = require('telescope')
local reload      = require('nvim-reload')
local compe       = require('compe')
local wk          = require('which-key')
local lsp         = require('lspconfig')
local compe       = require('compe')
local trouble     = require('trouble')
local lspkind     = require('lspkind')
local galaxy      = require('galaxyline')
local icons       = require('nvim-web-devicons')

-- Setup colorscheme
-- We could probably use a Lua function exposed by the package here but who
-- cares and that's what the documentation recommends anyways
local enable_256_color_space = true
local theme_array = {
  background   ; background_l ; background_ll ; background_lll ;
  foreground_d ; foreground   ; foreground_l  ; white ;
  red          ; orange       ; yellow        ; green ;
  teal         ; blue         ; pink          ; brown ;
}
local theme_array_clean = map(theme_array, function(x) return x:sub(2) end)
local theme = base16.theme_from_array(theme_array_clean)
base16(theme, enable_256_color_space)

-- Various Vim settings
-- I guess just use :help <something> when in doubt
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.hidden = true
opt.showcmd = false
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.number = false
opt.cursorline = true
opt.completeopt = 'menuone,noselect'
opt.pumheight = 10
opt.inccommand = 'nosplit'

vim.cmd('set noshowmode')

-- Telescope settings
telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    prompt_prefix = '▶ ',
    selection_caret = '→ ',
    color_devicons = true,
    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 0.15,
      prompt_position = 'top',
    },
    borderchars = {
      'z',
      prompt = { '─', '', '', '', '─', '─', '', '' },
      results = { '' },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
    },
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

hi('VertSplit', { guibg = 'NONE' })
hi('SignColumn', { guibg = 'NONE' })

hi('Search', { guibg = background_ll, guifg = foreground_d })
hi('IncSearch', { guibg = orange, guifg = background})

hi('LineNR', { guibg = 'NONE', guifg = background_ll })
hi('CursorLine', { guibg = 'NONE', guifg = 'NONE' })
hi('CursorLineNR', { guibg = 'NONE', guifg = background_lll })

hi('LspDiagnosticsDefaultError', { guibg = 'NONE', guifg = red })
hi('LspDiagnosticsDefaultWarning', { guibg = 'NONE', guifg = orange })
hi('LspDiagnosticsDefaultInformation', { guibg = 'NONE', guifg = blue })
hi('LspDiagnosticsDefaultHint', { guibg = 'NONE', guifg = blue })

hi('TroubleCount', { guibg = background_lll, guifg = background })
hi('TroubleFoldIcon', { guibg = 'NONE', guifg = background_ll })
hi('TroubleIndent', { guibg = 'NONE', guifg = background_ll })
hi('TroubleLocation', { guibg = 'NONE', guifg = background_lll })
hi('TroubleSource', { guibg = 'NONE', guifg = background_lll })

-- hi('IndentBlanklineChar', { guibg = 'NONE', guifg = background_l })
hi('IndentBlanklineChar', { guibg = 'NONE', guifg = background_l })

hi('TelescopeSelection', { guibg = 'NONE', guifg = foreground })
hi('TelescopeNormal', { guibg = background, guifg = foreground })

hi('TelescopeBorder', { guifg = background_lll })
hi('TelescopePromptBorder', { guifg = background_lll })
hi('TelescopeResultsBorder', { guifg = background_lll })
hi('TelescopePreviewBorder', { guifg = background_lll })

hi('TelescopeMatching', { guibg = background_ll, guifg = foreground_d })
hi('TelescopePromptPrefix', { guifg = green })

hi('HopUnmatched', { guibg = background, guifg = background_ll })
hi('HopNextKey', { guibg = background, guifg = red })
hi('HopNextKey1', { guibg = background, guifg = red })
hi('HopNextKey2', { guibg = background, guifg = red })

hi('ExtraWhitespace', { guibg = red })

-- Configure netrw
g.netrw_banner = 0

-- Remap the default leader (;) to ' ' (space)
g.mapleader = ' '

-- Configuration for which-key
wk.setup({
  icons = {
    breadcrumb = '»',
    separator = '→',
    group = '+',
  },
  window = {
    border = 'none',
    position = 'bottom',
    margin = { 1, 0, 1, 0 },
    padding = { 1, 0, 1, 0 },
  },
  layout = {
    height = { min = 1, max = 5 },
    spacing = 3,
    align = 'left',
  },
  show_help = false,
})

local function t(command)
  return '<cmd>Telescope ' .. command .. ' prompt_title= previewer=false<cr>'
end

-- Mappings for which-key
wk.register({
  ['<leader>'] = { t('buffers'), 'Buffer List' },

  ['s'] = { '<cmd>HopChar2<cr>', 'Jump To (2)' },
  ['S'] = { '<cmd>HopChar1<cr>', 'Jump To (1)' },

  ['n'] = { '<cmd>nohl<cr>', 'No Highlight' },

  ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Toogle Tree' },
  ['E'] = { '<cmd>NvimTreeFindFile<cr>', 'Toogle Tree' },

  ['z'] = { '/', 'Search' },

  a = {
    name = 'windows/buffer',
    o = { '<C-o>', 'Back Buffer' },
    i = { '<C-i>', 'Forward Buffer' },
    h = { '<C-w>h', 'Window Left' },
    H = { '<C-w>H', 'Window Left' },
    j = { '<C-w>j', 'Window Down' },
    J = { '<C-w>J', 'Window Down' },
    k = { '<C-w>k', 'Window Right' },
    K = { '<C-w>K', 'Window Right' },
    l = { '<C-w>l', 'Window Up' },
    L = { '<C-w>L', 'Window Up' },
    n = { '<cmd>bnext<cr>', 'Next Buffer' },
    p = { '<cmd>bprev<cr>', 'Previous Buffer' },
    d = { '<cmd>bdelete<cr>', 'Delete Buffer' },
    s = { '<cmd>split<cr>', 'Split Horizontally' },
    v = { '<cmd>vsplit<cr>', 'Split Vertically' },
    c = { '<cmd>close<cr>', 'Close' },
    q = { '<cmd>quit<cr>', 'Quit' },
  },

  d = {
    name = 'document',
    s = { '<cmd>w<cr>', 'Save Changes' },
    S = { '<cmd>wa<cr>', 'Save All Changes' },
    r = { '<cmd>u0<cr>', 'Restore Changes' },
  },

  f = {
    name = 'find',
    b = { t('buffers'), 'Find Buffers' },
    c = { t('command_history'), 'Command History' },
    C = { t('commands'), 'Command' },
    f = { t('git_files'), 'Find Files (Git)' },
    F = { t('find_files'), 'Find Files (All)' },
    g = { t('live_grep'), 'Find Text' },
    o = { t('vim_options'), 'Vim Option' },
    p = { t('oldfiles'), 'Previously Opened' },
    r = { t('registers'), 'Registers' },
  },

  l = {
    name = 'lsp',
    t = { '<cmd>TroubleToggle lsp_document_diagnostics<cr>', 'Document Diagnostics' },
    T = { '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', 'Workspace Diagnostics' },
    r = { t('lsp_references'), 'Show References' },
    d = { t('lsp_definitions'), 'Show Definitions' },
    i = { t('lsp_implementations'), 'Show Implementations' },
    f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format Buffer' },
    s = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show Signature' }
  },

  m = {
    name = 'misc',
    s = { '<cmd>source %<cr>', 'Source current' },
  },

  p = {
    name = 'packer',
    s = { '<cmd>PackerSync<cr>', 'Packer Sync' },
    u = { '<cmd>PackerUpdate<cr>', 'Packer Update' },
  },
}, { prefix = '<leader>' })


-- Enabled LSP servers
lsp.gopls.setup({})
lsp.tsserver.setup({})

-- Configuration for Compe
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

-- Configuration for trouble
trouble.setup({
  icons = true,
  fold_open = '',
  fold_closed = '',
  indent_lines = true,
  auto_open = false,
  auto_close = false,
  auto_preview = false,
  auto_fold = false,
  signs = {
    error = 'error',
    warning = 'warn',
    hint = 'hint',
    information = 'info',
    other = 'other',
  },
})

-- LSP icons
local signs = { Error = '▸ ', Warning = '▸ ', Hint = '▸ ', Information = '▸ ' }
for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  underline = false,
}
)

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

local gls = galaxy.section
galaxy.short_line_list = {'NvimTree', 'Trouble'}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

-- Don't call this function with no LSP attached
-- Stolen from https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_diagnostic.lua
function get_nvim_lsp_diagnostic(clients, diag_type)
  local count = 0

  for _, client in ipairs(clients) do
    count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(),diag_type,client.id)
  end

  return count
end

function pluralize(condition, string, plural)
  plural = 's'

  if condition then
    return string .. plural
  end

  return string
end

function line()
  local bg = background_l
  local fg = foreground_d

  local condition = require('galaxyline.condition')

  gls.left[1] = {
    mode = {
      provider = function()
        local alias = {
          n      = '  NORMAL ',
          i      = '  INSERT ',
          c      = '  COMMAND ',
          v      = '  VISUAL ',
          V      = '  VISUAL LINE ',
          [''] = '  VISUAL BLOCK '
        }

        local mode_colors = {
          n      = green,
          i      = red,
          c      = yellow,
          v      = pink,
          V      = pink,
          [''] = pink
        }

        hi('LineViMode', { guibg = mode_colors[vim.fn.mode()], guifg = bg })
        return alias[vim.fn.mode()]
      end,
      highlight = 'LineViMode',
      separator = ' ',
      separator_highlight = { bg, bg }
    }
  }

  gls.left[2] = {
    filename = {
      condition = buffer_not_empty,
      provider = { 'FileName' },
      highlight = { fg, bg },
      separator = '· ',
      separator_highlight = { background_lll, bg }
    }
  }

  gls.left[3] = {
    diagnostic = {
      provider = function()
        if next(vim.lsp.buf_get_clients(0)) == nil then
          hi('LineDiagnostic', { guibg = bg, guifg = fg })
          return 'no lsp'
        end

        local clients = vim.lsp.get_active_clients()
        local errors = get_nvim_lsp_diagnostic(clients, 'Error')
        local warnings = get_nvim_lsp_diagnostic(clients, 'Warning')
        local informations = get_nvim_lsp_diagnostic(clients, 'Information')
        local hints = get_nvim_lsp_diagnostic(clients, 'Hint')

        if errors ~= 0 then
          hi('LineDiagnostic', { guibg = bg, guifg = red })
          return errors .. pluralize(errors > 1, ' error')
        end

        if warnings ~= 0 then
          hi('LineDiagnostic', { guibg = bg, guifg = orange })
          return warnings .. pluralize(warnings > 1, ' warning')
        end

        if informations ~= 0 then
          hi('LineDiagnostic', { guibg = bg, guifg = blue })
          return informations .. pluralize(informations > 1, ' information')
        end

        if hints ~= 0 then
          hi('LineDiagnostic', { guibg = bg, guifg = blue })
          return hints .. pluralize(hints > 1, ' hint')
        end

        hi('LineDiagnostic', { guibg = bg, guifg = fg })
        return 'all good'
      end,
      highlight = 'LineDiagnostic',
    }
  }

  gls.right[4] = {
    line_percentage = {
      provider = 'LinePercent',
      highlight = 'LineViMode'
    },
  }

  gls.right[3] = {
    some_icon = {
      provider = function()
        return '  '
      end,
      highlight = 'LineViMode',
      separator = ' ',
      separator_highlight = { green, bg },
    }
  }

  gls.right[2] = {
    current_column = {
      provider = function()
        return vim.fn.virtcol('.')
      end,
      highlight = { fg, bg },
      separator = ',',
      separator_highlight = { fg, bg },
    }
  }

  gls.right[1] = {
    current_line = {
      provider = function()
        return vim.fn.line('.')
      end,
      highlight = { fg, bg },
    }
  }
end

line()

-- Avoid unthemed character
-- https://github.com/vim-airline/vim-airline-themes/issues/48
hi('StatusLine', { guibg = background_l })
hi('StatusLineNC', { guibg = background_l })

g.nvim_tree_width = 40
g.nvim_tree_ignore = { '.git', 'node_modules' }
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_ignore_ft = {}
g.nvim_tree_auto_resize = 0
g.nvim_tree_disable_netrw = 0
g.nvim_tree_hijack_netrw = 0

local tree_cb = require('nvim-tree.config').nvim_tree_callback
g.nvim_tree_bindings = {
  { key = { 'e' },          cb = tree_cb('edit') },
  { key = 'v',              cb = tree_cb('vsplit') },
  { key = 's',              cb = tree_cb('split') },
  { key = '<C-p>',          cb = tree_cb('parent_node') },
  { key = 'h',              cb = tree_cb('close_node') },
  { key = 'l',              cb = tree_cb('open_node') },
  { key = '<C-l>',          cb = tree_cb('cd') },
  { key = 'u',              cb = tree_cb('dir_up') },
  { key = '?',              cb = tree_cb('toggle_help') },
}

g.indentLine_enabled = 1
g.indent_blankline_char = '▏'
g.indent_blankline_filetype_exclude = { 'packer' }
g.indent_blankline_buftype_exclude = { 'help' }
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

icons.setup({
 override = {
  go = {
    icon = 'ﳑ',
    name = 'Golang',
    color = '#00AED8'
  },
 },
 default = true;
})

require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt' },
})

require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true
})
