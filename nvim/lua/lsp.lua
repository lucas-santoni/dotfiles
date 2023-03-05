-- Gutter icons
local signs = { Error = '▸ ', Warn = '▸ ', Hint = '▸ ', Info = '▸ ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
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
