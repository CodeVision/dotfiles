local lsp_setup = require('codevision.lsp.util').lsp_setup
local capabilities = require('codevision.lsp.util').capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local executable = vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h') .. '/bin/vscode-html-language-server'
lsp_setup({
  pattern = { 'html' },
  executable = executable,
  root_dir_files = { 'package.json', '.git' },
  custom_config = {
    name = 'HTML Language Server',
    cmd = { executable, '--stdio' },
    init_options = {
      configurationSection = { 'html', 'css', 'javascript' },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    },
    handlers = {
      ['textDocument/diagnostic'] = vim.lsp.diagnostic.on_diagnostic
    }
  }
})
