local galaxy = require('galaxyline')
local gls = galaxy.section

-- Helper to check if a buffer is empty
local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
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

  gls.right[4] = {
    line_percentage = {
      provider = 'LinePercent',
      highlight = 'LineViMode'
    },
  }

  gls.right[3] = {
    some_icon = {
      provider = function()
        return ''
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
}

line()
