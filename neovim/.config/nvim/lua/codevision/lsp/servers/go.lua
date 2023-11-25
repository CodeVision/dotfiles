local capabilities = require('codevision.lsp.util').capabilities

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'gomod', 'gowork', 'gotmpl' },
  callback = function()
    P('starting go pls')
    local executable = vim.fn.fnamemodify(vim.env.GOPATH, ':p:h') .. '/bin/gopls'
    if vim.fn.executable(executable) == 1 then
      vim.lsp.start({
        name = 'Go Language Server',
        cmd = { executable },
        root_dir = vim.fs.dirname(vim.fs.find({ "go.work", "go.mod", ".git" }, { upward = true })[1]),
        capabilities = capabilities,
      })
    end
  end
})
