-- Gutter icons
local signs = { Error = '▸ ', Warning = '▸ ', Hint = '▸ ', Information = '▸ ' }
for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- No virtual text, no underline
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
  }
)

-- Just adding some options to the `open_floating_preview` call. Otherwise
-- it's the default handler. See:
-- https://github.com/neovim/neovim/blob/d8f5f4d09078e7d52d1abd13418133da10b2cc27/runtime/lua/vim/lsp/handlers.lua
vim.lsp.handlers['textDocument/hover'] = function (_, method, result)
  local config = {
    max_width = 80,
    max_height = 15,
    pad_top = 1,
    pad_bottom = 1,
    focus_id = method,
  }

  if not (result and result.contents) then
    print('No information available!')
    return
  end

  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    print('No information (markdown output is empty?) available!')
    return
  end

  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

-- Kind of failed attempt at having the hover text in its own buffer
-- vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
--   local buf_handle = nil
--   for _, v in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.fn.bufname(v) == 'LSP Help' then
--       buf_handle = v
--       break
--     end
--   end

--   api.nvim_command('botright split new')
--   win_handle = api.nvim_tabpage_get_win(0)
--   buf_handle = api.nvim_win_get_buf(0)

--   api.nvim_buf_set_name(buf_handle, 'LSP Help')

--   api.nvim_buf_set_option(buf_handle, 'filetype', 'LSPHelp')
--   api.nvim_buf_set_option(buf_handle, "buftype", "nofile")
--   api.nvim_buf_set_option(buf_handle, "bufhidden", "wipe")
--   api.nvim_buf_set_option(buf_handle, "swapfile", false)
--   api.nvim_buf_set_option(buf_handle, "buflisted", false)

--   api.nvim_win_set_option(win_handle, "spell", false)
--   api.nvim_win_set_option(win_handle, "list", false)
--   api.nvim_win_set_option(win_handle, "winfixheight", true)
--   api.nvim_win_set_option(win_handle, "winfixwidth", true)
--   api.nvim_win_set_option(win_handle, "signcolumn", "no")
--   api.nvim_win_set_option(win_handle, "foldenable", false)
--   -- api.nvim_win_set_option(win_handle, "wrap", true)
--   -- api.nvim_buf_set_option(buf_handle, "winhighlight", "Normal:TroubleNormal,EndOfBuffer:TroubleNormal,SignColumn:TroubleNormal", true)
--   -- api.nvim_buf_set_option(buf_handle, "fcs", "eob: ", true)

--   -- run your stuff here, could be anything
--   -- jobID = api.nvim_call_function('termopen', {'$SHELL'})
--   local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--   -- table.insert(markdown_lines, 1, ' ') -- will be invisble
--   vim.lsp.util.stylize_markdown(buf_handle, markdown_lines, nil)

--   api.nvim_win_set_height(0, min(length(markdown_lines), 10))

--   api.nvim_buf_set_option(buf_handle, 'readonly', true)
--   api.nvim_buf_set_option(buf_handle, 'modifiable', false)

--   api.nvim_command('wincmd p') -- go back to previous window
-- end
