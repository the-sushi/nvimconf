require "set-options"
require "set-keys"
require "set-colors"

vim.treesitter.language.add('cpp')
vim.treesitter.language.register('cpp', { 'cpp', 'h' })

-- Clear the lsp log as it makes it easier to see what lppls is doing
-- while im working on it.
local log_path = vim.lsp.log.get_filename()
io.open(log_path, "w+"):close()

vim.g._ts_force_sync_parsing = true
