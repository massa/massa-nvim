return function(module)
  module.setup {
    default_params = {
      cmake = {
        dap_name = 'codelldb'
      }
    }
  }
  vim.keymap.set('n', '<F10>', function() vim.cmd [[Task start cmake debug]] end, { silent = true })
end
