require "set-options"
require "set-keys"
require "set-colors"

vim.treesitter.language.add('cpp')
vim.treesitter.language.register('cpp', { 'cpp', 'h' })
