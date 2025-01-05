require("lspconfig").yamlls.setup({
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
