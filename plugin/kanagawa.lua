require "pack" .add "gh:rebelot/kanagawa.nvim"

require "kanagawa" .setup
{
  compile = true,
  commentStyle = { italic = false },
  keywordStyle = { italic = false },
  statementStyle = { bold = false }
}

vim.cmd "colorscheme kanagawa-dragon"
vim.cmd "highlight Normal guibg=#-000002"
