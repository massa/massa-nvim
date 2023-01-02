-- nvim-module setup
return function(module)
  local luasnip = require 'luasnip'

  module.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = module.mapping.preset.insert {
      ['<C-d>'] = module.mapping.scroll_docs(-4),
      ['<C-f>'] = module.mapping.scroll_docs(4),
      ['<C-Space>'] = module.mapping.complete(),
      ['<CR>'] = module.mapping.confirm {
        behavior = module.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = module.mapping(function(fallback)
        if module.visible() then
          module.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = module.mapping(function(fallback)
        if module.visible() then
          module.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }

  vim.api.nvim_create_autocmd('FileType', {
    callback = function()
      module.setup.buffer {
        sources = {
          name = 'vim-dadbod-completion',
        }
      }
    end,
    pattern = 'sql,mysql,plsql',
  })
end
