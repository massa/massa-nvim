return function(module)
  module.setup { view = { adaptive_size = true } }
  vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
end
