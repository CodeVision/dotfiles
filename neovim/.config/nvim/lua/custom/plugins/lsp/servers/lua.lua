local on_attach = require('custom.plugins.lsp.util').on_attach

require('lspconfig').lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      telemetry = {
        enable = false
      }
    }
  }
})
