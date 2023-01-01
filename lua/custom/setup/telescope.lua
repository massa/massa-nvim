return function(module)
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  module.setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  }

  -- Enable telescope fzf native, if installed
  pcall(module.load_extension, 'fzf')

  local builtins = require 'telescope.builtin'

  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', builtins.oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader><space>', builtins.buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtins.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer]' })

  vim.keymap.set('n', '<leader>sf', builtins.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sh', builtins.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sw', builtins.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtins.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtins.diagnostics, { desc = '[S]earch [D]iagnostics' })
end
