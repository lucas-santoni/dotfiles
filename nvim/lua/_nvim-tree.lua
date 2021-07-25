vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', 'node_modules' }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_ignore_ft = {}
vim.g.nvim_tree_auto_resize = 0
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.nvim_tree_indent_markers = 1

local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.g.nvim_tree_bindings = {
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

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
}
