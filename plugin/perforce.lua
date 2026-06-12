require "pack" .add "gh:nfvs/vim-perforce"

-- TODO(sushi) it would be nice to custom implement a perforce plugin some 
--             day.

vim.g.perforce_open_on_change = 1
vim.g.perforce_prompt_on_open = 0
