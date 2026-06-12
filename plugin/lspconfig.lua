-- local util = require "util"
--
-- util.addPlugin "neovim/nvim-lspconfig"

require "pack" .add "gh:neovim/nvim-lspconfig"

vim.lsp.enable "lua_ls"
vim.lsp.enable "clangd"
