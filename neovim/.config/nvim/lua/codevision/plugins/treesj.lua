local tsj = require('treesj')

tsj.setup({
  use_default_keysmaps = false
})
vim.keymap.set('n', 'gS', tsj.split)
vim.keymap.set('n', 'gJ', tsj.join)
