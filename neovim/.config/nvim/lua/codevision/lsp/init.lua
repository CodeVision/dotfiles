require('codevision.lsp.servers.lua')
-- require('codevision.plugins.lsp.servers.ruby')
-- require('codevision.plugins.lsp.servers.rust')
require('codevision.lsp.servers.typescript')
require('codevision.lsp.servers.vue')

local nls = require('null-ls')
nls.setup({
  sources = {
    nls.builtins.diagnostics.eslint.with({
      diagnostics_format = "[#{c}] #{m} (#{s})",
      only_local = "node_modules/.bin"
    })
  }
})
