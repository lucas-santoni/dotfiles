local nvim_tree = require('nvim-tree')
local tree_cb = require('nvim-tree.config').nvim_tree_callback

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = false,
  diagnostics = {
    enable = false
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    side = 'left',
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
  },
  renderer = {
    indent_markers = {
      enable = true
    },
    icons = {
      show = {
        git = true,
        folder = true,
        file = true
      },
      glyphs = {
        default = "",
        symlink = "",
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = {
            "packer",
            "Trouble",
          }
        }
      }
    }
  }
})
