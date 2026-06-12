require "pack" .add "gh:chrisgrieser/nvim-origami"

-- Recommended by the plugin author: disable vim's auto folding.
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require "origami" .setup
{
  autoFold = 
  {
    enabled = false
  },

  foldKeymaps = 
  {
    setup = false
  }
}
