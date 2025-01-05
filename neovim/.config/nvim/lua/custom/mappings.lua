vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set('!', 'jj', '<Esc>')

vim.keymap.set('n', '<leader>b', '<c-^>')
vim.keymap.set('n', '<leader>em', ':messages<CR>')

vim.keymap.set('n', '<leader>x', ':source %<cr>')

vim.g.user_emmet_leader_key='<C-t>'

vim.keymap.set('i', '<c-y>', '<c-k>')
