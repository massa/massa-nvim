local name = 'rose-pine'
local module = require(name)
module.setup {
  disable_background = true
}
color = color or name
vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
