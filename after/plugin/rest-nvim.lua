local name = 'rest-nvim'
local module = require(name)
vim.keymap.set('n', '<Leader>r', '<Plug>RestNvim')
vim.keymap.set('n', '<Leader>pr', '<Plug>RestNvimPreview')
vim.keymap.set('n', '<Leader>lr','<Plug>RestNvimLast')
module.setup {}
