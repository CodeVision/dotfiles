require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "javascript" },

  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
