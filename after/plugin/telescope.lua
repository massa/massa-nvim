local name = 'telescope'
local module = require(name)
-- [[ configure telescope ]]
-- see `:help telescope` and `:help telescope.setup()`
module.setup {
  defaults = {
    mappings = {
      i = {
        ['<c-u>'] = false,
        ['<c-d>'] = false,
      },
    },
  },
}

-- enable telescope fzf native, if installed
pcall(module.load_extension, 'fzf')

pcall(module.load_extension, 'packer')

local builtins = require 'telescope.builtin'

-- see `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtins.oldfiles, { desc = '[?] find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtins.buffers, { desc = '[ ] find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- you can pass additional configuration to telescope to change theme, layout, etc.
  builtins.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', builtins.find_files, { desc = '[s]earch [f]iles' })
vim.keymap.set('n', '<leader>sh', builtins.help_tags, { desc = '[s]earch [h]elp' })
vim.keymap.set('n', '<leader>sw', builtins.grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sg', builtins.live_grep, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sd', builtins.diagnostics, { desc = '[s]earch [d]iagnostics' })
