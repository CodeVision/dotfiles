require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "javascript", "html", "css", "vue" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
