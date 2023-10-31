--
-- local function on_new_config(new_config, new_root_dir)
--   local function get_typescript_lib_path(root_dir)
--     local ts_path_suffix = util.path.join('node_modules', 'typescript', 'lib')
--     local global_ts = util.path.join(vim.env.NEOVIM_NODE, 'lib', ts_path_suffix)
--
--     local found_ts = ''
--     local function check_dir(path)
--       found_ts =  util.path.join(path, ts_path_suffix)
--       if util.path.exists(found_ts) then
--         return path
--       end
--     end
--     if util.search_ancestors(root_dir, check_dir) then
--       return found_ts
--     elseif util.path.exists(global_ts) then
--       return global_ts
--     else
--       return ''
--     end
--   end
--
--   if
--     new_config.init_options
--     and new_config.init_options.typescript
--     and new_config.init_options.typescript.tsdk == ''
--   then
--     new_config.init_options.typescript.tsdk = get_typescript_lib_path(new_root_dir)
--   end
-- end
--
-- require('lspconfig').volar.setup({
--   init_options = {
--     typescript = {
--       tsdk = "",
--     },
--   },
--   on_new_config = on_new_config,
--   capabilities = capabilities,
--   on_attach = on_attach,
--   flags = { debounce_text_changes = 150 },
--   settings = {
--     volar = { autoCompleteRefs = true },
--   },
--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
-- })
local function get_typescript_lib_path(root_dir)
  local ts_path_suffix = vim.fs.joinpath('node_modules', 'typescript', 'lib')
  local global_ts = vim.fs.joinpath(vim.env.NEOVIM_NODE, 'lib', ts_path_suffix)

  local ts_local = vim.fs.joinpath(root_dir, ts_path_suffix)
  if vim.fn.isdirectory(ts_local) == 1 then
    return ts_local
  elseif vim.fn.isdirectory(global_ts) == 1 then
    return global_ts
  else
    return ''
  end
end

local capabilities = require('codevision.lsp.util').capabilities
local is_vue_project = require('codevision.lsp.util').is_vue_project

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'javascript', 'vue' },
  callback = function()
    local executable = vim.fn.fnamemodify(vim.env.NEOVIM_NODE, ':p:h') .. '/bin/vue-language-server'
    if vim.fn.executable(executable) == 1 then
      local root_dir = vim.fs.dirname(vim.fs.find({ 'package.json', '.git' }, { upward = true })[1])
      if not is_vue_project(root_dir) then
        return
      end
      vim.lsp.start({
        name = 'Volar - Vue Language Server',
        cmd = { executable, '--stdio' },
        root_dir = root_dir,
        capabilities = capabilities,
        init_options = {
          typescript = {
            tsdk = get_typescript_lib_path(root_dir)
          },
        },
        settings = {
          volar = { autoCompleteRefs = true },
        },
        flags = { debounce_text_changes = 150 },
      })
    end
  end
})
