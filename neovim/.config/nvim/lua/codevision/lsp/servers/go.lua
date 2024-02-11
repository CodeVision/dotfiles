local lsp_setup = require('codevision.lsp.util').lsp_setup

local executable = vim.fn.fnamemodify(vim.env.GOPATH, ':p:h') .. '/bin/gopls'
lsp_setup({
  name = 'Go Language Server',
  pattern = { 'go', 'gomod', 'gowork', 'gotmpl' },
  executable = executable,
  root_dir_files = { "go.work", "go.mod", ".git" },
  custom_config = {
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analysis = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      }
    },
    init_options = {
      usePlaceholders = true
    }
  }
})
