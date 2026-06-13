require "pack" .add "gh:nvim-mini/mini.nvim"

-- * --------------------------------------------------------------------------

require "mini.align" .setup { }

-- * --------------------------------------------------------------------------

require "mini.pairs" .setup { }

local pairs = MiniPairs
local comp = vim.fn.complete_info

-- Setup keymap to choose a completion when the pum (whatever) is visible
-- but fallback to mini's pairs if its not.
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info().selected == -1 then
      return "<C-e>"..pairs.cr()
    else
      return "<C-y>"
    end
  else
    return pairs.cr()
  end
end, { expr = true, silent = true })

vim.keymap.set("i", "<S-CR>", function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info().selected == -1 then
      return "<C-n><C-y>"
    else
      return "<C-y>"
    end
  else
    return pairs.cr()
  end
end, { expr = true, silent = true })
