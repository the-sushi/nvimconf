
local o = vim.opt
local g = vim.g

-- Use ' ' as map leader
g.mapleader = ' '

-- Set *proper* indentation options.
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true

-- Show a line at column 80.
o.colorcolumn = "80"

-- Never show sign column ("gutter").
o.signcolumn = "no"

-- No wrapping.
o.wrap = false

-- Disable swapfiles, they're annoying.
o.swapfile = false

-- Disable so that my editor doesn't get fucked up if I open someone else's 
-- repo.
g.editorconfig = false

-- Diagnostics.
vim.diagnostic.config
{
  virtual_text = true
}
