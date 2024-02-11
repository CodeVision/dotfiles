local lsp_setup = require('codevision.lsp.util').lsp_setup

local executable = vim.env.HOME .. '/.local/bin/marksman'
lsp_setup({
  pattern = { 'markdown', 'markdown.mdx' },
  root_dir_files = { ".git", ".marksman.toml" },
  custom_config = {
    name = 'Marksman Language Server',
    cmd = { executable, "server" },
  }
})
