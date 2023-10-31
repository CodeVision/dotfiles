local capabilities = require('codevision.lsp.util').capabilities

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
    local executable = vim.fn.fnamemodify(vim.env.NEOVIM_PYTHON, ':p:h') .. '/pylsp'
    if vim.fn.executable(executable) == 1 then
      vim.lsp.start({
        name = 'Python Language Server',
        cmd = { executable },
        root_dir = vim.fs.dirname(vim.fs.find({ 'setup.py', 'pyproject.toml' }, { upward = true })[1]),
        capabilities = capabilities
      })
    end
  end
})
