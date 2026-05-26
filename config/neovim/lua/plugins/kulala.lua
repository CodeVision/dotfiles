require("kulala").setup({
  lsp = {
    enable = false,
    filetypes = { "http", "rest", "json", "yaml", "bruno", "markdown" }
  },
  global_keymaps = true,
  global_keymaps_prefix = "<leader>R",
  kulala_keymaps_prefix = "",
})
