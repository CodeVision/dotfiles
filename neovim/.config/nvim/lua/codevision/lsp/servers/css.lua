local lsp_setup = require('codevision.lsp.util').lsp_setup
local capabilities = require('codevision.lsp.util').capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local executable = vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h') .. '/bin/vscode-css-language-server'
lsp_setup({
  pattern = { 'css', 'scss', 'less' },
  executable = executable,
  root_dir_files = { 'package.json', '.git' },
  custom_config = {
    name = 'CSS Language Server',
    cmd = { executable, '--stdio' },
    capabilities = capabilities,
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    },
    handlers = {
      ['textDocument/diagnostic'] = vim.lsp.diagnostic.on_diagnostic
    }
  }
})
