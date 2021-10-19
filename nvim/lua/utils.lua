function map(arr, f)
  local res = {}
  for k, v in pairs(arr) do
    res[k] = f(v)
  end return res
end

function length(arr)
  local c = 0
  for _ in pairs(arr) do
    c = c + 1
  end
  return c
end

function min(a, b)
  if (a > b) then
    return b
  end
  return a
end

-- Helper to map Telescope bindings
function t(command)
  return '<cmd>' .. tdb(command) .. '<cr>'
end

-- Helper to map Telescope bindings (for the dashboard)
function tdb(command)
  return 'Telescope ' .. command .. ' prompt_title= previewer=false'
end
