local lazypath = vim.fn.stdpath("data") .."/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
    'nvim-lua/plenary.nvim',

    -- files
    config({
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      branch = '0.1.x',
    }, 'telescope-nvim'),
    { 'nvim-telescope/telescope-fzy-native.nvim', build = 'make' },
    setup('kylechui/nvim-surround'),

    -- coding
    setup('windwp/nvim-autopairs'),
    config({
      'Wansmer/treesj',
      keys = { 'gM', 'gJ', 'gS' },
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
    }, 'treesj'),
    setup('numToStr/Comment.nvim'),
    config({
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    }),
    'RRethy/nvim-treesitter-endwise',
    --  { 'nvim-treesitter/nvim-treesitter-textobjects' }
    config('NvChad/nvim-colorizer.lua'),
    config({
      'folke/trouble.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    }, 'trouble-nvim'),
    setup({
      'folke/flash.nvim',
      event = 'VeryLazy',
      opts = {},
      keys = {
        { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      }
    }),

    -- completion
    config('hrsh7th/nvim-cmp'),
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',

    config('folke/neodev.nvim', 'neodev'),
    config('neovim/nvim-lspconfig', 'codevision.lsp'),
    'onsails/lspkind.nvim',
    config({
      'nvimdev/lspsaga.nvim',
      event = 'LspAttach',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    }, 'lspsaga-nvim'),
    'jose-elias-alvarez/null-ls.nvim',

    -- snippets
    config('L3MON4D3/LuaSnip'),
    'saadparwaiz1/cmp_luasnip',

    'mattn/emmet-vim',

    -- debugging
    'mfussenegger/nvim-dap',
    setup({
      'rcarriga/nvim-dap-ui',
      dependencies = 'mfussenegger/nvim-dap'
    }, 'dapui'),
    {
      'microsoft/vscode-js-debug',
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git co -- package-lock.json',
      lazy = true
    },
    config({
      'mxsdev/nvim-dap-vscode-js',
      dependencies = { 'mfussenegger/nvim-dap' }
    }, 'dap-vscode-js'),

    -- misc
    config({
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      ft = { "markdown" },
    }, 'markdown-preview-nvim'),

    -- languages
    'stevearc/vim-arduino',
    'simrat39/rust-tools.nvim',
    'vim-ruby/vim-ruby',

    -- interface
    setup({
      'j-hui/fidget.nvim',
      tag = 'legacy'
    }),
    config({
      'kevinhwang91/nvim-ufo',
      dependencies = { 'kevinhwang91/promise-async' },
    }),
    setup({
      'kevinhwang91/nvim-bqf',
      ft = 'qf'
    }, 'bqf'),
    config('luukvbaal/statuscol.nvim', 'statuscol-nvim'),
    config({
      'nvim-neo-tree/neo-tree.nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
      },
      branch = 'v3.x',
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
    config({
      'mrjones2014/smart-splits.nvim',
      commit = '3d4239b',
    }, 'smart-splits-nvim'),
    config('Mofiqul/vscode.nvim', 'vscode-nvim'),
  }
end

local lazy = require('lazy').setup(startup())

configure()

return lazy
