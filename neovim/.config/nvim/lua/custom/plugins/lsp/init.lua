require('neodev').setup({})

require('mason').setup()
require('mason-lspconfig').setup()

-- servers
require('custom.plugins.lsp.lua')
