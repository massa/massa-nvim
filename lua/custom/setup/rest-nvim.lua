return function(module)
  vim.keymap.set('n', '<Leader>r', '<Plug>RestNvim')
  vim.keymap.set('n', '<Leader>pr', '<Plug>RestNvimPreview')
  vim.keymap.set('n', '<Leader>lr','<Plug>RestNvimLast')
  module.setup {}
end
