local galaxy = require('galaxyline')
local gls = galaxy.section

-- Helper to check if a buffer is empty
local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

-- Don't call this function with no LSP attached
-- Stolen from https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_diagnostic.lua
local function get_nvim_lsp_diagnostic(clients, severity)
  local count = 0

  for _, client in ipairs(clients) do
    count = count + length(vim.diagnostic.get(vim.api.nvim_get_current_buf(), { severity = severity }))
  end

  return count
end

-- Helper to pluralize a word
local function pluralize(condition, string, plural)
  plural = 's'

  if condition then
    return string .. plural
  end

  return string
end

local function line()
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
      provider = function() return
        require('galaxyline.provider_fileinfo').get_current_file_name('', '')
      end,
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
        local errors = get_nvim_lsp_diagnostic(clients, vim.diagnostic.severity.ERROR)
        local warnings = get_nvim_lsp_diagnostic(clients, vim.diagnostic.severity.WARN)
        local informations = get_nvim_lsp_diagnostic(clients, vim.diagnostic.severity.INFO)
        local hints = get_nvim_lsp_diagnostic(clients, vim.diagnostic.severity.HINT)

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
          hi('LineDiagnostic', { guibg = bg, guifg = white})
          return hints .. pluralize(hints > 1, ' hint')
        end

        hi('LineDiagnostic', { guibg = bg, guifg = fg })
        return '👍'
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

-- These buffers will always look like there are inactive
galaxy.short_line_list = {
  'NvimTree',
  'Trouble',
  'LSPHelp'
}

line()
