local lazypath = vim.fn.stdpath("data") .."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local configs = {}
local load_config = function()
  for _, v in ipairs(configs) do
    local module_location = v
    if not vim.startswith(v, 'codevision') then
      module_location = 'codevision.plugins.' .. v
    end
    local success, result = pcall(require, module_location)
    if not success then
      print('failed loading ' .. v .. ': ' .. result)
    end
  end
end

local add_config = function(config)
  table.insert(configs, config)
end

local setups = {}
local perform_setup = function()
  for _, v in ipairs(setups) do
    local success, module = pcall(require, v)
    if success and module then
      module.setup({})
    else
      print('failed to setup ' .. v)
    end
  end
end

local add_setup = function(name)
  table.insert(setups, name)
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

local startup = function()
  local config = function(plugin, config_file)
    if config_file == nil then
      local config_files = vim.fn.fnamemodify(get_name(plugin):lower(), ':r')
      add_config(config_files)
    else
      add_config(config_file)
    end

    return { plugin }
  end

  local setup = function(plugin, name)
    if name == nil then
      add_setup(vim.fn.fnamemodify(get_name(plugin), ':r'))
    else
      add_setup(name)
    end

    return { plugin }
  end

  return {
    --  plugins
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',

    -- files
    config({
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      tag = '0.1.0',
    }, 'telescope-nvim'),
    { 'nvim-telescope/telescope-fzy-native.nvim', build = 'make' },
    setup('kylechui/nvim-surround'),

    -- coding
    setup('windwp/nvim-autopairs'),
    -- { 'AndrewRadev/splitjoin.vim' },
    setup('numToStr/Comment.nvim'),
    config({
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    }),
    'RRethy/nvim-treesitter-endwise',

    --  { 'nvim-treesitter/playground' }
    --  { 'nvim-treesitter/nvim-treesitter-textobjects' }
    config('NvChad/nvim-colorizer.lua'),
    config({
      'folke/trouble.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    }, 'trouble-nvim'),

    -- completion
    config('hrsh7th/nvim-cmp'),
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',

    config('neovim/nvim-lspconfig', 'codevision.lsp'),
    'onsails/lspkind.nvim',
    config({
      'glepnir/lspsaga.nvim',
      event = 'BufRead',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    }, 'lspsaga-nvim'),
    'jose-elias-alvarez/null-ls.nvim',

    -- snippets
    config('L3MON4D3/LuaSnip'),
    'saadparwaiz1/cmp_luasnip',

    -- misc
    config({
      'nvim-neorg/neorg',
      build = ':Neorg sync-parsers',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }, 'nvim-neorg'),

    -- languages
    'stevearc/vim-arduino',
    'simrat39/rust-tools.nvim',
    'vim-ruby/vim-ruby',

    -- interface
    setup('j-hui/fidget.nvim'),
    config({
      'kevinhwang91/nvim-ufo',
      dependencies = { 'kevinhwang91/promise-async' },
    }),
    config('luukvbaal/statuscol.nvim', 'statuscol-nvim'),
    config({
      'nvim-neo-tree/neo-tree.nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim'
      },
      branch = 'v2.x',
    }, 'neo-tree-nvim'),
    config({
      'romgrk/barbar.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    }, 'barbar-nvim'),
    config('vim-airline/vim-airline'),
    {
      'tomasiser/vim-code-dark',
      build = 'cp autoload/airline/themes/codedark.vim ../vim-airline/autoload/airline/themes'
    },
    config('mrjones2014/smart-splits.nvim', 'smart-splits-nvim'),
    config('Mofiqul/vscode.nvim', 'vscode-nvim'),
  }
end

local lazy = require('lazy').setup(startup())

configure()

return lazy
