local telescope = require('telescope')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    prompt_prefix = '→  ',
    selection_caret = '· ',
    color_devicons = true,
    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 0.40,
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
