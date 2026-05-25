vim.filetype.add({
  pattern = {
    [".*/templates/.*%.ya?ml"] = function(path)
      local dir = vim.fs.dirname(path)
      local chart = vim.fs.find("Chart.yaml", {
        upward = true,
        path = dir,
      })[1]

      if chart then
        local root = vim.fs.dirname(chart)

        if path:find(root .. "/templates/", 1, true) then
          return "helm"
        end
      end

      return "yaml"
    end,
  },
})
