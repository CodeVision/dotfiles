local is_vue_project = require('codevision.lsp.util').is_vue_project

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'javascript' },
  callback = function()
    local ts_executable = vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h') .. '/bin/typescript-language-server'
    if vim.fn.executable(ts_executable) == 1 then
      local root_dir = vim.fs.dirname(vim.fs.find({ 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' }, { upward = true })[1])
      if is_vue_project(root_dir) then
        return
      end
      vim.lsp.start({
        name = 'TypeScript Language Server',
        cmd = { ts_executable, '--stdio' },
        root_dir = root_dir,
        init_options = {
          hostInfo = "neovim"
        },
      })
    end
  end
})
