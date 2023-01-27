local name = 'nvim-tree'
local module = require(name)
module.setup { view = { adaptive_size = true } }
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
