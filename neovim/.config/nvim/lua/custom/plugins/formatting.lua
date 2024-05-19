local tsj = require('treesj')

tsj.setup({
  use_default_keymaps = false
})
vim.keymap.set('n', 'gS', tsj.split)
vim.keymap.set('n', 'gJ', tsj.join)
