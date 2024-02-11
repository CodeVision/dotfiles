require('codevision.lsp.servers.css')
require('codevision.lsp.servers.emmet')
require('codevision.lsp.servers.go')
require('codevision.lsp.servers.html')
require('codevision.lsp.servers.lua')
require('codevision.lsp.servers.markdown')
require('codevision.lsp.servers.python')
require('codevision.lsp.servers.ruby')
require('codevision.lsp.servers.rust')
require('codevision.lsp.servers.typescript')
require('codevision.lsp.servers.vue')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local bufopts = { silent = true, buffer = ev.buf }
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
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    severity_sort = true
  }
)

local nls = require('null-ls')
nls.setup({
  sources = {
    nls.builtins.diagnostics.eslint.with({
      diagnostics_format = "[#{c}] #{m} (#{s})",
      only_local = "node_modules/.bin"
    })
  }
})
