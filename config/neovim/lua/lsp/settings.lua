local settings = {
  yamlls = {
    yaml = {
      validate = true,
      completion = true,
      hover = true,
      schemaStore = {
        enable = true
      },
      kubernetesCRDStore = {
        enable = true,
        url = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main",
      }
    },
    redhat = {
      telemetry = {
        enabled = false
      }
    }
  }
}

return settings
