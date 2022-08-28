local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '⚠'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', opts)

