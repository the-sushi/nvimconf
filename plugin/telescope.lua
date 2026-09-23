require "pack" .add 
{ 
  "gh:nvim-telescope/telescope.nvim",
  "gh:nvim-telescope/telescope-fzy-native.nvim",
  "gh:nvim-telescope/telescope-frecency.nvim",
  "gh:nvim-lua/plenary.nvim"
}

local telescope = require "telescope"

telescope.setup 
{ 
  defaults = 
  {
    path_display = { "filename_first" }
  }
}

telescope.load_extension 'fzy_native'
telescope.load_extension 'frecency'

---@type FrecencyOpts
local frecency_conf = 
{
  auto_validate = true,
  matcher = "fuzzy"
}

require "frecency.config" .setup(frecency_conf)

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<c-e>", function()
  builtin.find_files
  {
    find_command = 
    {
      "rg", 
      "--ignore", 
      "--files", 
      "--color", "never",
      "-g", "!llvm"
    }
  }
end)

-- vim.keymap.set("n", "<C-a>", function()
--   telescope.extensions.frecency.frecency 
--   {
--     workspace = "CWD",
--     theme = "ivy"
--   }
-- end)

vim.keymap.set("n", "<C-g>", function()
  builtin.live_grep()
end)

vim.keymap.set("n", "<C-f>", function()
  builtin.current_buffer_fuzzy_find()
end)

vim.keymap.set("n", "<C-s>", function()
  builtin.lsp_document_symbols()
end)
