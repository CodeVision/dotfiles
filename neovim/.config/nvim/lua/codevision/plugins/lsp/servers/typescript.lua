local capabilities = require('codevision.plugins.lsp.util').capabilities
local on_attach = require('codevision.plugins.lsp.util').on_attach

require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h') .. '/bin/typescript-language-server', '--stdio' }
})
