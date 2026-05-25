local settings = require("lsp.settings")

settings.yamlls.yaml.format = { enable = true }

return require("schema-companion").setup_client(
  require("schema-companion").adapters.yamlls.setup({
    sources = {
      -- your sources for the language server
      require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
      require("schema-companion").sources.lsp.setup(),
      require("schema-companion").sources.schemas.setup({
        {
          name = "Kubernetes master",
          uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
        },
        {
          name = "flux cd",
          uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/all.json",
        }
      }),
    },
  }),
  {
    cmd = function(dispatchers, config)
      local cmd = 'yaml-language-server'
      if (config or {}).root_dir then
        local local_cmd = vim.fs.joinpath(config.root_dir, 'node_modules/.bin', cmd)
        if vim.fn.executable(local_cmd) == 1 then
          cmd = local_cmd
        end
      end
      return vim.lsp.rpc.start({ cmd, '--stdio' }, dispatchers)
    end,
    filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
    root_markers = { '.git' },
    settings = settings.yamlls,
    on_init = function(client)
      --- https://github.com/neovim/nvim-lspconfig/pull/4016
      --- Since formatting is disabled by default if you check `client:supports_method('textDocument/formatting')`
      --- during `LspAttach` it will return `false`. This hack sets the capability to `true` to facilitate
      --- autocmd's which check this capability
      client.server_capabilities.documentFormattingProvider = true
    end,

  }
)
