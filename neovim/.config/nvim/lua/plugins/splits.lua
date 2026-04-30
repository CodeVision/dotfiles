local ss = require('smart-splits')


-- resizing splits
vim.keymap.set({ 'n', 't' }, '<A-h>', ss.resize_left)
vim.keymap.set({ 'n', 't' }, '<A-j>', ss.resize_down)
vim.keymap.set({ 'n', 't' }, '<A-k>', ss.resize_up)
vim.keymap.set({ 'n', 't' }, '<A-l>', ss.resize_right)
-- moving between splits
vim.keymap.set({ 'n', 't' }, '<C-h>', ss.move_cursor_left)
vim.keymap.set({ 'n', 't' }, '<C-j>', ss.move_cursor_down)
vim.keymap.set({ 'n', 't' }, '<C-k>', ss.move_cursor_up)
vim.keymap.set({ 'n', 't' }, '<C-l>', ss.move_cursor_right)
