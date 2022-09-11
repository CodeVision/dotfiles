require('codevision.lsp.servers.lua')
require('codevision.lsp.servers.ruby')
require('codevision.lsp.servers.rust')
require('codevision.lsp.servers.typescript')

local nls = require('null-ls')
nls.setup({
  sources = {
    nls.builtins.diagnostics.eslint.with({
      diagnostics_format = "[#{c}] #{m} (#{s})"
    })
  }
})
