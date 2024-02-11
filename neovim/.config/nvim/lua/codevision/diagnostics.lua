vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '⚠',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '',
    }
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true
})
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = opts.name
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn',  text = '⚠'})
sign({name = 'DiagnosticSignHint',  text = '⚑'})
sign({name = 'DiagnosticSignInfo',  text = ''})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', opts)
