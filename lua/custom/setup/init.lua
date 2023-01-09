local function setup(module, plugin)
  if not plugin then plugin = module end
  module = 'custom.setup.' .. module
  local plugin_installed, plugin_module = pcall(require, plugin)
  if not plugin_installed then return end
  local module_installed, module_function = pcall(require, module)
  if not module_installed then return end
  module_function(plugin_module)
end

setup('colors', 'rose-pine')
setup 'nvim-navic'
setup 'bufferline'
setup 'harpoon'
setup 'Comment'
setup 'indent_blankline'
setup 'gitsigns'
setup 'telescope'
setup('treesitter', 'nvim-treesitter.configs')
setup('lsp', 'lsp-zero')
setup 'cmp'
setup 'nvim-tree'
setup 'dap'
setup 'tasks'
setup 'csvtools'
setup 'rest-nvim'
