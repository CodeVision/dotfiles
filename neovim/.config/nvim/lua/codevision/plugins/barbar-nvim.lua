require('bufferline').setup({
  icons = { buffer_index = true, filetype = { enabled = true } }
})

local opts = { silent = true }
vim.keymap.set('n', '1<leader>b', '<cmd>BufferGoto 1<cr>', opts)
vim.keymap.set('n', '2<leader>b', '<cmd>BufferGoto 2<cr>', opts)
vim.keymap.set('n', '3<leader>b', '<cmd>BufferGoto 3<cr>', opts)
vim.keymap.set('n', '4<leader>b', '<cmd>BufferGoto 4<cr>', opts)
vim.keymap.set('n', '5<leader>b', '<cmd>BufferGoto 5<cr>', opts)
vim.keymap.set('n', '6<leader>b', '<cmd>BufferGoto 6<cr>', opts)
vim.keymap.set('n', '7<leader>b', '<cmd>BufferGoto 7<cr>', opts)
vim.keymap.set('n', '8<leader>b', '<cmd>BufferGoto 8<cr>', opts)
vim.keymap.set('n', '9<leader>b', '<cmd>BufferGoto 9<cr>', opts)

vim.keymap.set('n', '<leader>bp', '<cmd>BufferPin<cr>', opts)
vim.keymap.set('n', '<leader>bq', '<cmd>BufferClose<cr>', opts)
vim.keymap.set('n', '<leader>bo', '<cmd>BufferCloseAllButCurrent<cr>', opts)
vim.keymap.set('n', '<leader>bm', '<cmd>BufferPick<cr>', opts)

-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     if vim.bo.filetype == 'neo-tree' then
--       require'bufferline.api'.set_offset(40, 'FileTree')
--     end
--   end
-- })
--
-- vim.api.nvim_create_autocmd('BufWinLeave', {
--   pattern = '*',
--   callback = function()
--     if vim.fn.expand('<afile>'):match('neo-tree') then
--       require'bufferline.api'.set_offset(0)
--     end
--   end
-- })
