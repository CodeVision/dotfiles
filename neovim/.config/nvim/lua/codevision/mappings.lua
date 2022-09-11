-- mappings
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local keymap = vim.keymap.set
keymap('n', '<F3>', ':source %<CR>', { silent = true })

keymap('!', 'jj', '<Esc>', { noremap = true })

keymap('n', '<leader>b', '<c-^>', { noremap = true })
keymap('n', '<leader>q', ':bd<cr>', { noremap = true })

-- keymap({ 'n', 'v' }, 'k', 'gk')
-- keymap({ 'n', 'v' }, 'j', 'gj')

