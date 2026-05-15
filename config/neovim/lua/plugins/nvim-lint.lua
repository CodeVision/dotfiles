local config_map = {
  eslint = {
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "eslint.config.ts",
    "eslint.config.mts",
    "eslint.config.cts",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json"
  }
}

require("lint").linters_by_ft = {
  javascript = { "eslint" },
  typescript = { "eslint" },
  json = { "jsonlint" }
}

local find_config = function(config_files)
  local found_files = vim.fs.find(config_files, { upward = true, type = 'file', stop = os.getenv('HOME') })
  return #found_files > 0
end

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    local lint = require("lint")

    local ft = vim.bo.filetype
    local configured_linters = lint.linters_by_ft[ft]
    if configured_linters == nil then
      return
    end

    local run_linters = {}
    for _, linter in ipairs(configured_linters) do
      if config_map[linter] ~= nil then
        if find_config(config_map[linter]) then
          table.insert(run_linters, linter)
        end
      else
        table.insert(run_linters, linter)
      end
    end

    lint.try_lint(run_linters)
  end
})
