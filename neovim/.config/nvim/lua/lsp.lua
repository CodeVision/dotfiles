local vim = vim
local lspconfig = require('lspconfig')


local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('completion').on_attach()

  local opts = { noremap = true, silent = true }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'g0', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<CR>', opts)
end

lspconfig.diagnosticls.setup({
  filetypes = { 'javascript', 'javascript.jsx'},
  init_options = {
    filetypes = {
      typescript = 'eslint',
      javascript = 'eslint',
      ['javascript.jsx'] = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint',
    },
    linters = {
      eslint = {
        sourceName = 'eslint',
        command = "./node_modules/.bin/eslint",
        rootPatterns = { '.git', 'package.json' },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
})

local servers = {sumneko_lua=on_attach, tsserver=on_attach, jsonls=on_attach}
for lsp, attach_func in pairs(servers) do
  lspconfig[lsp].setup({
    on_attach = attach_func
  })
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = ''
    },
    signs = true,
    update_in_insert = true,
  }
)

vim.fn.sign_define(
  "LspDiagnosticsSignError", {
    text = "",
    texthl = "LspDiagnosticsSignError"
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning", {
    text = "",
    texthl = "LspDiagnosticsSignWarning",
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation", {
    text = "",
    texthl = "LspDiagnosticsSignInformation"
  }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint", {
    text = "➤",
    texthl = "LspDiagnosticsSignHint"
  }
)

vim.g.completion_chain_complete_list = {
  default = {
    default = {
      { complete_items = {'lsp', 'snippet', 'buffers'}},
      { mode = '<c-p>' },
      { mode = '<c-n>' }
    },
    comment = {
      { complete_items = {'buffers'}}
    },
    string = {
      { complete_items = {'path'}}
    },
  }
}

