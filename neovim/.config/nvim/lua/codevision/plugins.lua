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

local startup = function(use)
  local config_use = function(plugin, config)
    use(plugin)

    if config ~= nil then
      add_config(config)
    end
  end

  local setup_use = function(plugin, name)
    use(plugin)

    add_setup(name)
  end

  --  plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- files
  config_use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    tag = '0.1.0',
  }, 'telescope-nvim')
  use { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }
  setup_use('kylechui/nvim-surround', 'nvim-surround')

  -- coding
  use 'gpanders/editorconfig.nvim'
  use { 'AndrewRadev/splitjoin.vim', keys = { 'gJ', 'gS' } }
  setup_use('numToStr/Comment.nvim', 'Comment')
  config_use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }, 'nvim-treesitter')
  --  use { 'nvim-treesitter/playground' }
  --  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  config_use('NvChad/nvim-colorizer.lua', 'nvim-colorizer')

  -- completion
  config_use('hrsh7th/nvim-cmp', 'nvim-cmp')
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

  config_use('neovim/nvim-lspconfig', 'codevision.lsp')
  use 'onsails/lspkind.nvim'
  config_use('glepnir/lspsaga.nvim', 'lspsaga-nvim')
  use 'jose-elias-alvarez/null-ls.nvim'
  setup_use('j-hui/fidget.nvim', 'fidget' )
  config_use({
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
  }, 'nvim-ufo')

  -- snippets
  config_use('L3MON4D3/LuaSnip', 'luasnip')
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
  config_use('vim-airline/vim-airline', 'vim-airline')
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
