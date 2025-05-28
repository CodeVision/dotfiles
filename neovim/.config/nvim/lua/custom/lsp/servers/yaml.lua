vim.lsp.config('yamlls', {
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    },
    yaml = {
      schemas = {
        kubernetes = "*.yaml"
      }
    }
  }
})
