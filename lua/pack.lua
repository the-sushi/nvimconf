local m = {}

-- * --------------------------------------------------------------------------

local prefixes =
{
  gh = "https://github.com/"
}

local prefix_pattern = "^(%w+):"

-- * --------------------------------------------------------------------------

local function replacePrefix(name)
  return (name:gsub(prefix_pattern, prefixes))
end

-- * --------------------------------------------------------------------------

m.add = function(x)
  if type(x) == "table" then
    vim.iter(x):each(function(elem)
      m.add(elem)
    end)
  else
    vim.pack.add { replacePrefix(x) }
  end
end

return m
