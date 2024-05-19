local cmp = require('cmp')

local lspkind = require('lspkind')
lspkind.init({})

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    })
  }),
  formatting = {
    fields = { 'abbr', 'kind' },
    format = function(entry, item)
      local kind = lspkind.cmp_format({
        mode = 'symbol_text',
        preset = 'default',
        maxwidth = 40,
      })(entry, item)
      local source_name_map = {
        buffer = "[buf]",
        nvim_lsp = "[lsp]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]"
      }

      local kind_string = vim.split(kind.kind, '%s', { trimempty = true })
      kind.kind = string.format("\t\t%s %-10s%7s", kind_string[1], kind_string[2], source_name_map[entry.source.name])

      -- item.dup = ({ nvim_lua = 1 })[entry.source.name] or 0
      return item
    end,
    expandable_indicator = true
  }
})

-- add completion highlights
local highlight = vim.api.nvim_set_hl
highlight(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough = true, fg='#808080' })
highlight(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
highlight(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })
highlight(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
highlight(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
highlight(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
highlight(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
highlight(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
highlight(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
highlight(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
highlight(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
