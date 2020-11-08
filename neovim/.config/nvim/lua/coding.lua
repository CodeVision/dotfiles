require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "javascript" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
