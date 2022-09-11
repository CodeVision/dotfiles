local capabilities = require('codevision.lsp.util').capabilities
local on_attach = require('codevision.lsp.util').on_attach

-- Setup rust_analyzer via rust-tools.nvim
require("rust-tools").setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
  tools = {
    inlay_hints = {
      highlight = "IndentBlanklineContextChar"
    }
  }
})
