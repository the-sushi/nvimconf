require "set-options"
require "set-keys"
require "set-colors"

vim.treesitter.language.add('cpp')
vim.treesitter.language.register('cpp', { 'cpp', 'h' })

vim.g._ts_force_sync_parsing = true
