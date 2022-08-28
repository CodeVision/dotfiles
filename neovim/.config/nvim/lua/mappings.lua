-- mappings
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local mapkey = vim.keymap.set
mapkey('n', '<F3>', ':source %<CR>', { silent = true })

mapkey('!', 'jj', '<Esc>', { noremap = true })

mapkey('n', '<leader>b', '<c-^>', { noremap = true })

-- vim.keymap.set({ 'n', 'v' }, 'k', 'gk')
-- vim.keymap.set({ 'n', 'v' }, 'j', 'gj')

