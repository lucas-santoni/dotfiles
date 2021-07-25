local trouble = require('trouble')

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
