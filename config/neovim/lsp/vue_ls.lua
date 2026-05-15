local global_packages = vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h')

return {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue "},
  root_markers = { "package.json", ".git" },
  init_options = {
    tsdk = global_packages .. "/lib/node_modules/typescript/lib"
  },
}
