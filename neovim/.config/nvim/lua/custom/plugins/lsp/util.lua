local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function get_package_json(filename)
  if vim.fn.filereadable(filename) == 1 then
    local lines = vim.fn.readfile(filename)

    local config = vim.json.decode(table.concat(lines, ""))
    return config
  end

  return nil
end

local function is_vue_project(root_dir)
  if not root_dir then
    return false
  end

  local package_json = get_package_json(vim.fs.joinpath(root_dir, 'package.json'))

  if
    package_json
    and package_json.dependencies
    and package_json.dependencies.vue
  then
    return true
  else
    return false
  end
end

local function get_executable(config)
  if type(config.cmd) == "string" then
    return config.cmd
  end
  return config.cmd[1]
end

local function lsp_setup(config)
  local root_dir = vim.fs.dirname(vim.fs.find(config.root_dir_files, { upward = true })[1])
  local base_config = {
    root_dir = root_dir,
    capabilities = capabilities,
    single_file_support = true,
    settings = {},
    init_options = {}
  }
  if config.executable ~= nil then
    base_config.cmd = { config.executable }
  end
  local lsp_config = vim.tbl_deep_extend("force", base_config, config.custom_config)

  vim.api.nvim_create_autocmd('FileType', {
    pattern = config.pattern,
    callback = function()
      if vim.fn.executable(get_executable(lsp_config)) == 1 then
        vim.lsp.start(lsp_config)
      end
    end
  })
end

return {
  capabilities = capabilities,
  get_package_json = get_package_json,
  is_vue_project = is_vue_project,
  lsp_setup = lsp_setup
}
