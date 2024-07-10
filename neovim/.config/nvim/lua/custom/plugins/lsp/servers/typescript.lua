local capabilities = require('custom.plugins.lsp.util').capabilities

require('lspconfig').tsserver.setup({
  capabilities = capabilities
})
