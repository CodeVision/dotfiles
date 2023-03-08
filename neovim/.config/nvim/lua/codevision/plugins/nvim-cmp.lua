local cmp = require('cmp')
local lspkind = require('lspkind')

-- add completion highlights
local highlight = vim.api.nvim_set_hl
highlight(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough = true, fg='#808080' })
highlight(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
highlight(0, 'CmpItemAbbrMatchFuzzy', { bg='NONE', fg='#569CD6' })
highlight(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
highlight(0, 'CmpItemKindInterface', { bg='NONE', fg='#9CDCFE' })
highlight(0, 'CmpItemKindText', { bg='NONE', fg='#9CDCFE' })
highlight(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
highlight(0, 'CmpItemKindMethod', { bg='NONE', fg='#C586C0' })
highlight(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
highlight(0, 'CmpItemKindProperty', { bg='NONE', fg='#D4D4D4' })
highlight(0, 'CmpItemKindUnit', { bg='NONE', fg='#D4D4D4' })

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-space>'] = cmp.mapping.complete(),
    ['<c-b>'] = cmp.mapping.scroll_docs(4),
    ['<c-f>'] = cmp.mapping.scroll_docs(-4),
    ['<c-y'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }
    -- ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer', keyword_length = 3 },
  }),
  formatting = {
    fields = { 'abbr', 'kind' }, -- removed menu for rust analyzer
    format = function(entry, item)
      local kind = lspkind.cmp_format({
        mode = 'symbol_text',
        preset = 'codicons',
        maxwidth = 40,
      })(entry, item)
      -- local source_icons = {
      --   nvim_lsp = 'λ',
      --   nvim_lua = '☾',
      --   luasnip = '⋗',
      --   buffer = 'Ω',
      --   path = '🖫'
      -- }
      local source_name_map = {
        buffer = "[buf]",
        nvim_lsp = "[lsp]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]"
      }

      local kind_string = vim.split(kind.kind, '%s', { trimempty = true })
      kind.kind = string.format("\t\t%s %-10s%7s", kind_string[1], kind_string[2], source_name_map[entry.source.name])

      item.dup = ({ nvim_lua = 0 })[entry.source.name] or 0
      return item
    end
  },
  experimental = {
    ghost_text = { hl_group = 'NvimTreeIndentMarker' }
  }
})
