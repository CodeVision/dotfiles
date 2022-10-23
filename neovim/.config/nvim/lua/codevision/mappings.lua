-- mappings
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set('n', '<F3>', ':source %<CR>', { silent = true })

vim.keymap.set('!', 'jj', '<Esc>')

vim.keymap.set('n', '<leader>b', '<c-^>')

-- keymap({ 'n', 'v' }, 'k', 'gk')
-- keymap({ 'n', 'v' }, 'j', 'gj')

