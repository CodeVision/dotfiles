-- local capabilities = require('codevision.lsp.util').capabilities
--
-- require('lspconfig').lua_ls.setup({
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         globals = { 'vim' }
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file('', true),
--         checkThirdParty = false
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   }
-- })
local lsp_setup = require('codevision.lsp.util').lsp_setup

lsp_setup({
  pattern = { 'lua' },
  executable = '/usr/bin/lua-language-server',
  root_dir_files = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git'
  },
  custom_config = {
    name = 'Lua Language Server',
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false
        },
        telemetry = {
          enable = false,
        },
      },
    }
  }
})
