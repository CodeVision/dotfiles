-- mappings
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set('n', '<F3>', ':source %<CR>', { silent = true })

vim.keymap.set('!', 'jj', '<Esc>')

vim.keymap.set('n', '<leader>b', '<c-^>')

-- keymap({ 'n', 'v' }, 'k', 'gk')
-- keymap({ 'n', 'v' }, 'j', 'gj')

vim.keymap.set('n', '<F11>', '<C-o>', { remap = false, silent = true })
vim.keymap.set('n', '<C-o>', function()
  local start_buffer_name = vim.api.nvim_buf_get_name(0)
  local start_buffer_id = vim.fn.bufnr('%')
  vim.cmd('execute "normal \\<F11>"')
  local current_buffer = vim.api.nvim_buf_get_name(0)
  if start_buffer_name ~= current_buffer then
    vim.api.nvim_buf_delete(start_buffer_id, {})
  end
end, { silent = true })
