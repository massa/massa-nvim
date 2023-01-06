return function(module)
  module.preset 'recommended'
  local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    perlnavigator = {},
    raku_navigator = {},
    sumneko_lua = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = { globals = { 'vim' } },
        },
      }
    },
    sqls = {
    },
  }
  module.set_preferences({
    set_lsp_keymaps = { omit = { '<F2>', '<F4>' } }
  })
  module.on_attach(function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, bufnr)
    end
  end)
  module.nvim_workspace()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  module.setup {
    ensure_installed = vim.tbl_keys(servers),
    setup_handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup(vim.tbl_extend({ capabilities = capabilities }, servers[server_name]))
      end,
    }
  }
  require('fidget').setup()
end
