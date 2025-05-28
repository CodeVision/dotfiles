-- servers
require('custom.lsp.servers.css')
require('custom.lsp.servers.go')
require('custom.lsp.servers.json')
require('custom.lsp.servers.lua')
require('custom.lsp.servers.terraform')
require('custom.lsp.servers.typescript')
require('custom.lsp.servers.vue')
require('custom.lsp.servers.yaml')

vim.lsp.enable({
  "cssls",
  "gopls",
  "jsonls",
  "luals",
  "yamlls",
  "ts_ls",
  "vue_ls",
  "terraformls"
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local bufopts = { silent = true, buffer = args.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<cr>', bufopts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'H', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', bufopts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<cr>', bufopts)
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
})
