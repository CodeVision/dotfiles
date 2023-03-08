local util = require 'lspconfig.util'
local capabilities = require('codevision.lsp.util').capabilities
local on_attach = require('codevision.lsp.util').on_attach

local function on_new_config(new_config, new_root_dir)
  local function get_typescript_lib_path(root_dir)
    local ts_path_suffix = util.path.join('node_modules', 'typescript', 'lib')
    local global_ts = util.path.join(vim.env.NEOVIM_NODE, 'lib', ts_path_suffix)

    local found_ts = ''
    local function check_dir(path)
      found_ts =  util.path.join(path, ts_path_suffix)
      if util.path.exists(found_ts) then
        return path
      end
    end
    if util.search_ancestors(root_dir, check_dir) then
      return found_ts
    elseif util.path.exists(global_ts) then
      return global_ts
    else
      return ''
    end
  end

  if
    new_config.init_options
    and new_config.init_options.typescript
    and new_config.init_options.typescript.tsdk == ''
  then
    new_config.init_options.typescript.tsdk = get_typescript_lib_path(new_root_dir)
  end
end

require('lspconfig').volar.setup({
    init_options = {
        typescript = {
            tsdk = "",
        },
    },
    on_new_config = on_new_config,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    settings = {
        volar = { autoCompleteRefs = true },
    },
})
