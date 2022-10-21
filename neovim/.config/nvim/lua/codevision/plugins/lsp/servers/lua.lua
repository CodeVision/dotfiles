local capabilities = require('codevision.plugins.lsp.util').capabilities
local on_attach = require('codevision.plugins.lsp.util').on_attach

require('lspconfig').sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  }
})
