local cmp = require('cmp')

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
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        nvim_lua = '☾',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫'
      }

      item.menu = menu_icon[entry.source.name]

      item.dup = ({ nvim_lua = 0 })[entry.source.name] or 0
      return item
    end
  }
})
