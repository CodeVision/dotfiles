local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-space>'] = cmp.mapping.complete(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  }),
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      menu = ({
        nvim_lsp = 'λ',
        nvim_lua = '☾',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫'
      }),

      before = function(entry, item)
        item.dup = ({ nvim_lua = 0 })[entry.source.name] or 0
        return item
      end
    })
  }
})
