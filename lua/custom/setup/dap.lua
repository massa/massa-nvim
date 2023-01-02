return function(module)
  vim.keymap.set('n', '<F9>', module.continue, { silent = true })
  vim.keymap.set('n', '<F8>', module.step_into, { silent = true })
  vim.keymap.set('n', '<F7>', module.step_over, { silent = true })
  vim.keymap.set('n', '<F6>', module.step_out, { silent = true })
  vim.keymap.set('n', '<F5>', module.toggle_breakpoint, { silent = true })
  vim.keymap.set('n', '<Leader>b', module.toggle_breakpoint, { silent = true })
  vim.keymap.set('n', '<Leader>B', function() module.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { silent = true })
  vim.keymap.set('n', '<Leader>lp', function() module.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true })
  vim.keymap.set('n', '<Leader>dr', module.repl.open, { silent = true })
  vim.keymap.set('n', '<Leader>dl', module.run_last, { silent = true })

  module.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = '${port}',
    executable = {
      command = 'codelldb',
      args = { '--port', '${port}' },
      detached = false,
    },
  }
  module.configurations.cpp = {
    {
      name = 'Attach',
      type = 'codelldb',
      request = 'attach',
      cwd = '${workspaceFolder}',
      terminal = 'integrated',
    },
    {
      name = 'Launch',
      type = 'codelldb',
      request = 'launch',
      cwd = '${workspaceFolder}',
      terminal = 'integrated',
    },
  }
  module.configurations.c = module.configurations.cpp
  module.configurations.rust = module.configurations.cpp

  local api = vim.api
  local keymap_restore = {}
  module.listeners.after['event_initialized']['me'] = function()
    for _, buf in pairs(api.nvim_list_bufs()) do
      local keymaps = api.nvim_buf_get_keymap(buf, 'n')
      for _, keymap in pairs(keymaps) do
        if keymap.lhs == "K" then
          table.insert(keymap_restore, keymap)
          api.nvim_buf_del_keymap(buf, 'n', 'K')
        end
      end
    end
    api.nvim_set_keymap(
      'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
  end

  module.listeners.after['event_terminated']['me'] = function()
    for _, keymap in pairs(keymap_restore) do
      api.nvim_buf_set_keymap(
        keymap.buffer,
        keymap.mode,
        keymap.lhs,
        keymap.rhs,
        { silent = keymap.silent == 1 }
      )
    end
    keymap_restore = {}
  end

  local dapui = require 'dapui'
  dapui.setup()
  vim.keymap.set('n', '<Leader>D', dapui.toggle, { silent = true })

  module.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  module.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  module.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  
  require('nvim-dap-virtual-text').setup()

  require('telescope').load_extension('dap')
end
