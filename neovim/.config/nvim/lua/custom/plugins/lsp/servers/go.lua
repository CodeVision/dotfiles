local capabilities = require('custom.plugins.lsp.util').capabilities

require('lspconfig').gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        append = true,
        assign = true,
        atomic = true,
        nilness = true,
        nonewvars = true,
        shadow = true,
        undeclaredname = true,
        unreachable = true,
        unusedparams = true,
        unusedvariable = true,
        unusedwrite = true,
        useany = true
      },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
        vendor = true,
        upgrade_dependency = true
      },
      experimentalPostfixCompletions = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true
      },
      -- diagnosticsDelay = '500ms',
      staticcheck = true,
      gofumpt = true
    }
  },
  init_options = {
    usePlaceholders = true
  }
})
