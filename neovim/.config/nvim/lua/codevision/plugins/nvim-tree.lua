require('nvim-tree').setup({
  view = {
    adaptive_size = true,
  }
})

vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')
