require "pack" .add "gh:neovim/nvim-lspconfig"

vim.lsp.config("lua_ls", 
  { 
    cmd = 
    { 
      "lua-language-server", 
      "--logpath=./luals.log",
      -- "--loglevel=trace",
    }
  })

vim.lsp.enable "lua_ls"
vim.lsp.enable "clangd"
vim.lsp.enable "lppls"

