require "pack" .add 
{
  "gh:nvim-tree/nvim-tree.lua",
  "gh:nvim-tree/nvim-web-devicons",
}

require "nvim-tree" .setup
{
  view = 
  {
    preserve_window_proportions = true,
  },

  actions =
  {
    open_file = 
    {
      resize_window = false
    }
  }
}

local nt = require "nvim-tree.api"

vim.keymap.set("n", "<S-W>", function()
  nt.tree.open
  {
    current_window = true
  }
end)
