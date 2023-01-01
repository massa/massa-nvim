return function(module)
  module.setup {
      dap_open_command = function(...) require('dapui').open(...) end,
  }
  vim.keymap.set('n', '<F5>', function() vim.cmd [[Task start cmake debug]] end, { silent = true })
end
