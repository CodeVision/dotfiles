local settings = require("lsp.settings")

return require("kube-yaml").helm_lsp_config({
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm", "yaml.helm-values" },
  root_markers = { "Chart.yaml" },
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
        config = { validate = true, completion = true, hover = true },
        settings = settings,
      },
    },
  },
})
