local set = vim.keymap.set

-- Save file with alt+w.
set("n", "<M-w>", "<cmd>w<cr>")

-- Exit terminal with esc.
set("t", "<esc>", "<c-\\><c-n>")

-- `<leader>{` wraps the current visual-block in braces and indents 
-- inside of it.
set("v", "<leader>{", "c{<enter>}<esc>PVi{>[{")
