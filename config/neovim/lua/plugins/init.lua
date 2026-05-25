
-- local config = function(plugin, name)
--   if name then
--     plugin.config = function()
--       local success = pcall(require, "plugins." .. name)
--       if not success then
--         print("failed to load config for: " .. name)
--       end
--     end
--   end
--   return plugin
-- end
--
-- local setup = function(plugin)
--   plugin.opts = plugin.opts or {}
--   return plugin
-- end

local urlize = function(plugin_name)
  if not (vim.startswith(plugin_name, ".") or
    vim.startswith(plugin_name, "/") or
    vim.startswith(plugin_name, "~") or
    string.match(plugin_name, "^https?://")) then
      return "https://github.com/" .. plugin_name
  else
    return plugin_name
  end
end

local normalize = function(plugin)
  if type(plugin) == "table" then
    plugin.src = urlize(plugin.src)
    return plugin
  else
    return urlize(plugin)
  end

end

local config = function(plugin, name)
  vim.pack.add({ normalize(plugin) })
  require("plugins." .. name)
end

local last_index_of = function(str, char)
  for i = #str, 1, -1 do
    if str:sub(i, i) == char then
      return i
    end
  end

  return nil
end

local setup = function(plugin, opts)
  vim.pack.add({ normalize(plugin) })

  local plugin_name = plugin.name
  if not plugin.name then
    local slash_index = last_index_of(plugin.src, "/")
    plugin_name = string.sub(plugin.src, slash_index + 1)
  end

  require(plugin_name).setup(opts or {})
end

local load = function(plugin, name)
  vim.opt.runtimepath:append(plugin.src)

  if name ~= nil then
    require("plugins." .. name)
  end
end

local add = function(obj)
  for i, value in ipairs(obj) do
    obj[i]= normalize(value)
  end
  vim.pack.add(obj)
end

add({
  { name = 'plenary', src = 'nvim-lua/plenary.nvim' },
  { name = 'devicons', src = 'nvim-tree/nvim-web-devicons' },
})

-- treesitter
config({ src = 'arborist-ts/arborist.nvim' }, 'treesitter') -- build = ":TSUpdate"
config({ src = 'RRethy/nvim-treesitter-endwise' }, 'treesitter')

-- text
setup({ src = 'kylechui/nvim-surround', version = vim.version.range("^3") })
config({ src = 'windwp/nvim-autopairs' }, 'autopairs')
config({ src = 'Wansmer/treesj' }, 'text')

config({ src = 'junegunn/vim-easy-align' }, 'easy-align')

-- search
config({ src = 'folke/flash.nvim' }, 'flash')

-- file picker
config({ src = "ibhagwan/fzf-lua" }, "fuzzy")

-- lsp
setup({ name = "lazydev", src = 'folke/lazydev.nvim' }, {
  library = {
    'luvit-meta/library'
  },
  lspconfig = false
})
add({
  { src = 'Bilal2453/luvit-meta' },
  { src = 'neovim/nvim-lspconfig' },
  'Bekaboo/dropbar.nvim',
})
setup({ name = 'ltex-client', src = "icewind/ltex-client.nvim" })
config({ src = 'nvimdev/lspsaga.nvim'}, 'lspsaga')
setup({ name = 'fidget', src = 'j-hui/fidget.nvim' })
config({ src = 'mfussenegger/nvim-lint' }, 'nvim-lint')

config({ src = "cenk1cenk2/schema-companion.nvim" }, 'schema-companion')
add({{ src = "mfussenegger/nvim-ansible" }})

setup({ name = 'tiny-inline-diagnostic', src = "rachartier/tiny-inline-diagnostic.nvim" })
vim.diagnostic.config({ virtual_text = false })

-- completion
add({{ src = 'L3MON4D3/LuaSnip', version = vim.version.range('v2') }}) -- build = 'make install_jsregexp'
config({ src = 'saghen/blink.cmp', version = vim.version.range('^1') }, 'completion')
add({ 'mattn/emmet-vim' })

-- ai
add({{ src = 'folke/snacks.nvim' }})
config({ src = 'coder/claudecode.nvim' }, 'ai')

-- testing
add({
  { src = 'nvim-neotest/nvim-nio' },
  { src = 'antoinemadec/FixCursorHold.nvim' },
  { src = 'fredrikaverpil/neotest-golang' }
})
config({ src = 'nvim-neotest/neotest' }, 'testing')

-- visual
config({ src = 'Mofiqul/vscode.nvim' }, 'vscode')
config({ src = 'akinsho/bufferline.nvim', version = 'main' }, 'bufferline')
add({ 'famiu/bufdelete.nvim' })
config({ src = 'luukvbaal/statuscol.nvim' }, 'statuscol')
setup({ name = 'lualine', src = 'nvim-lualine/lualine.nvim' })
add({ 'kevinhwang91/promise-async' })
config({ src = 'kevinhwang91/nvim-ufo' }, 'folds')
setup({ name = 'colorizer', src = 'NvChad/nvim-colorizer.lua' }, {
  filetypes = { 'css', 'conf', 'lua' }
})
setup({ name = 'rainbow_csv', src = 'cameron-wags/rainbow_csv.nvim' })
config({ src = 'MeanderingProgrammer/render-markdown.nvim' }, "markdown")
add({{ name = 'markdown-preview', src = "iamcco/markdown-preview.nvim" }})  -- build = "cd app && npx --yes yarn install"
-- "tpope/vim-dadbod",
-- "kristijanhusak/vim-dadbod-completion",
-- "kristijanhusak/vim-dadbod-ui",

-- navigation
config({ src = 'mrjones2014/smart-splits.nvim' }, 'splits')
add({ 'MunifTanjim/nui.nvim' })
load({ src = '~/dev/contrib/neo-tree.nvim' }, 'neo-tree')
  -- {
  --   "vhyrro/luarocks.nvim",
  --   opts = {
  --     rocks = { "molde" }
  --   }
  -- },
setup({ src = 'nvim-orgmode/orgmode' })
-- setup({ src = 'lukas-reineke/headlines.nvim', name = 'headlines' })
load({ src = "~/dev/contrib/org-super-agenda.nvim/" }, 'orgmode')

load({ src = '~/dev/projects/nvim/whatodo.nvim' }, 'whatodo')
