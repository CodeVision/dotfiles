local lsp_setup = require('codevision.lsp.util').lsp_setup
local capabilities = require('codevision.lsp.util').capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local executable = vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h') .. '/bin/emmet-language-server'
lsp_setup({
  pattern = {
    "astro",
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "svelte",
    "typescriptreact",
    "vue",
  },
  executable = executable,
  root_dir_files = { 'package.json', '.git' },
  custom_config = {
    name = 'Emmet Language Server',
    cmd = { executable, '--stdio' },
    capabilities = capabilities,
    init_options = {
      --- @type table<string, any> https://docs.emmet.io/customization/preferences/
      preferences = {},
      --- @type "always" | "never" defaults to `"always"`
      showexpandedabbreviation = "always",
      --- @type boolean defaults to `true`
      showabbreviationsuggestions = true,
      --- @type boolean defaults to `false`
      showsuggestionsassnippets = false,
      --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
      syntaxprofiles = {},
      --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
      variables = {},
      --- @type string[]
      excludelanguages = {},
    },
  }
})
