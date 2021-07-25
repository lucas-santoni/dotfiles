local wk = require('which-key')

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

-- Helper to map Telescope bindings
local function t(command)
  return '<cmd>Telescope ' .. command .. ' prompt_title= previewer=false<cr>'
end

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
    R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
    d = { t('lsp_definitions'), 'Show Definitions' },
    i = { t('lsp_implementations'), 'Show Implementations' },
    f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format Buffer' },
    h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Show Help' }
  },

  m = {
    name = 'misc',
    s = { '<cmd>source %<cr>', 'Source Current' },
    h = { '<cmd>echo map(synstack(line(\'.\'), col(\'.\')), \'synIDattr(v:val, "name")\') <cr>', 'Show Highlight Group' },
  },

  p = {
    name = 'packer',
    s = { '<cmd>PackerSync<cr>', 'Packer Sync' },
    u = { '<cmd>PackerUpdate<cr>', 'Packer Update' },
  },
}, { prefix = '<leader>' })
