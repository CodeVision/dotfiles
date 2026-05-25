-- local ts = require('nvim-treesitter')


vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
    gohtml = 'gotmpl',
    gohtmltmpl = 'gotmpl',
    gohtxtmpl = 'gotmpl',
    gohtexttmpl = 'gotmpl',
  }
})

local hl_disabled_langs = { "csv" }
local indent_disabled_langs = { "vue" }

require("arborist").setup({
  disable = {
    highlight = hl_disabled_langs,
    indent_disabled_langs = indent_disabled_langs
  },
  ensure_installed = {
    'lua',
    'javascript',
    'typescript',
    'go',
    'markdown',
    'markdown_inline',
    'yaml',
    'Dockerfile'
  }
})


