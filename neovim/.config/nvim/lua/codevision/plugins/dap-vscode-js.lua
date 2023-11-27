require('dap-vscode-js').setup({
  debugger_path = vim.fn.expand("~/.local/share/nvim/lazy/vscode-js-debug"),
  adapters = { 'pwa-node' }
})

for _, language in ipairs({ 'typescript', 'javascript' }) do
  require('dap').configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}'
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach',
      program = require('dap.utils').pick_process,
      cwd = '${workspaceFolder}'
    }
  }
end
