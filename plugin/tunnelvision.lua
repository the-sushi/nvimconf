require "pack" .add "gh:leolaurindo/tunnelvision.nvim"

local tv = require "tunnelvision"

tv.setup
{
  mode = "flow",
  scope = "function",
  direction = "both",
}

vim.keymap.set("n", "<leader>v", "<cmd>TunnelVision on<CR>")

vim.keymap.set("n", "<Esc>", function()
  if tv.is_active() then
    tv.off()
    return ""
  end
  return "<Esc>"
end)
