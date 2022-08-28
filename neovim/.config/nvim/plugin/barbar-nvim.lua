require('bufferline').setup({
  icons = 'both'
})

local mapkey = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

mapkey('n', '1<leader>b', '<cmd>BufferGoto 1<cr>', opts)
mapkey('n', '2<leader>b', '<cmd>BufferGoto 2<cr>', opts)
mapkey('n', '3<leader>b', '<cmd>BufferGoto 3<cr>', opts)
mapkey('n', '4<leader>b', '<cmd>BufferGoto 4<cr>', opts)
mapkey('n', '5<leader>b', '<cmd>BufferGoto 5<cr>', opts)
mapkey('n', '6<leader>b', '<cmd>BufferGoto 6<cr>', opts)
mapkey('n', '7<leader>b', '<cmd>BufferGoto 7<cr>', opts)
mapkey('n', '8<leader>b', '<cmd>BufferGoto 8<cr>', opts)
mapkey('n', '9<leader>b', '<cmd>BufferGoto 9<cr>', opts)
