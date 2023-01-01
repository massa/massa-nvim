return function(module)
  vim.keymap.set('n', '<F9>', module.continue, { silent = true })
  vim.keymap.set('n', '<F7>', module.step_over, { silent = true })
  vim.keymap.set('n', '<F8>', module.step_into, { silent = true })
  vim.keymap.set('n', '<F6>', module.step_out, { silent = true })
  vim.keymap.set('n', '<Leader>b', module.toggle_breakpoint, { silent = true })
  vim.keymap.set('n', '<Leader>B', function() module.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { silent = true })
  vim.keymap.set('n', '<Leader>lp', function() module.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true })
  vim.keymap.set('n', '<Leader>dr', module.repl.open, { silent = true })
  vim.keymap.set('n', '<Leader>dl', module.run_last, { silent = true })

  module.adapters.cpp = {
    type = 'executable',
    attach = {
      pidProperty = "pid",
      pidSelect = "ask"
    },
    command = 'lldb-vscode',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
  }

  module.configurations.cpp = {
    {
      name = "lldb",
      type = "cpp",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      externalTerminal = false,
      stopOnEntry = false,
      args = {}
    },
  }

  local dapui = require 'dapui'
  dapui.setup()
  vim.keymap.set('n', '<Leader>D', dapui.toggle, { silent = true })
end
