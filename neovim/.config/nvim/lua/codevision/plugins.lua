local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local configs = {}
local load_config = function()
  for _, v in ipairs(configs) do
    local module_location = v
    if not vim.startswith(v, 'codevision') then
      module_location = 'codevision.plugins.' .. v
    end
    local success = pcall(require, module_location)
    if not success then
      print('failed loading ' .. v)
    end
  end
end

local add_config = function(config)
  table.insert(configs, config)
end

local setup = {}
local perform_setup = function()
  for _, v in ipairs(setup) do
    local success, module = pcall(require, v)
    if success and module then
      module.setup({})
    else
      print('failed to setup ' .. v)
    end
  end
end

local add_setup = function(name)
  table.insert(setup, name)
end

local configure = function()
  load_config()
  perform_setup()
end

local get_name = function(plugin)
  local plugin_name
  if type(plugin) == 'table' then
    plugin_name = plugin[1]
  else
    plugin_name = plugin
  end

  return vim.fs.basename(plugin_name)
end

local startup = function(use)
  local config_use = function(plugin, config_file)
    use(plugin)

    if config_file == nil then
      local config_files = vim.fn.fnamemodify(get_name(plugin):lower(), ':r')
      add_config(config_files)
    else
      add_config(config_file)
    end
  end

  local setup_use = function(plugin, name)
    use(plugin)

    if name == nil then
      add_setup(vim.fn.fnamemodify(get_name(plugin), ':r'))
    else
      add_setup(name)
    end
  end

  --  plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- files
  config_use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    tag = '0.1.0',
  }, 'telescope-nvim')
  use { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }
  setup_use('kylechui/nvim-surround')

  -- coding
  use 'gpanders/editorconfig.nvim'
  setup_use('windwp/nvim-autopairs')
  use { 'AndrewRadev/splitjoin.vim', keys = { 'gJ', 'gS' } }
  setup_use('numToStr/Comment.nvim')
  config_use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })
  --  use { 'nvim-treesitter/playground' }
  --  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  config_use('NvChad/nvim-colorizer.lua')
  config_use({
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  }, 'trouble-nvim')

  -- completion
  config_use('hrsh7th/nvim-cmp')
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

  config_use('neovim/nvim-lspconfig', 'codevision.lsp')
  use 'onsails/lspkind.nvim'
  config_use('glepnir/lspsaga.nvim', 'lspsaga-nvim')
  use 'jose-elias-alvarez/null-ls.nvim'
  setup_use('j-hui/fidget.nvim')
  config_use({
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
  })

  -- snippets
  config_use('L3MON4D3/LuaSnip')
  use 'saadparwaiz1/cmp_luasnip'

  -- interface
  config_use({
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    branch = 'v2.x',
  }, 'neo-tree-nvim')
  config_use({
    'romgrk/barbar.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  }, 'barbar-nvim')
  config_use('vim-airline/vim-airline')
  use {
    'tomasiser/vim-code-dark',
    run = 'cp autoload/airline/themes/codedark.vim ../vim-airline/autoload/airline/themes'
  }
  config_use('mrjones2014/smart-splits.nvim', 'smart-splits-nvim')
  config_use('Mofiqul/vscode.nvim', 'vscode-nvim')

  if packer_bootstrap then
    require('packer').sync()
  end
end

local packer = require('packer').startup({
  startup
})

configure()

return packer
