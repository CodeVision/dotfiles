local capabilities = require('codevision.lsp.util').capabilities
local on_attach = require('codevision.lsp.util').on_attach

require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
