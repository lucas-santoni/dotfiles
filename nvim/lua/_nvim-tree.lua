local nvim_tree = require('nvim-tree')
local tree_cb = require('nvim-tree.config').nvim_tree_callback
nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  lsp_diagnostics = false,
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 40,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {
        { key = { 'e' },  cb = tree_cb('edit') },
        { key = 'v',      cb = tree_cb('vsplit') },
        { key = 's',      cb = tree_cb('split') },
        { key = '<C-p>',  cb = tree_cb('parent_node') },
        { key = 'h',      cb = tree_cb('close_node') },
        { key = 'l',      cb = tree_cb('open_node') },
        { key = '<C-l>',  cb = tree_cb('cd') },
        { key = 'u',      cb = tree_cb('dir_up') },
        { key = '?',      cb = tree_cb('toggle_help') },
      }
    }
  }
})

vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_ignore = { '.git', 'node_modules' }
vim.g.nvim_tree_indent_markers = 1

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
}

vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "packer",
    "Trouble",
  }
}
