local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

local config = function(plugin, name)
  if name then
    plugin.config = function()
      local success = pcall(require, "custom.plugins." .. name)
      if not success then
        print("failed to load config for: " .. name)
      end
    end
  end
  return plugin
end

local setup = function(plugin)
  plugin.opts = {}
  return plugin
end

require("lazy").setup({
  { name = 'plenary',    'nvim-lua/plenary.nvim' },
  { name = 'devicons',   'nvim-tree/nvim-web-devicons' },
  { name = 'treesitter', 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },

  -- treesitter
  config({
    'RRethy/nvim-treesitter-endwise',
    dependencies = { 'treesitter' },
  }, 'treesitter'),

  -- text
  setup({
    'kylechui/nvim-surround',
    version = "*",
    event = "VeryLazy",
  }),
  config({ 'windwp/nvim-autopairs', event = 'InsertEnter' }, 'autopairs'),
  config({
    'Wansmer/treesj',
    keys = { 'gM', 'gJ', 'gS' },
    dependencies = { 'treesitter' },
  }, 'text'),
  config({ 'junegunn/vim-easy-align' }, 'easy-align'),

  -- search
  setup({
    'folke/flash.nvim',
    event = "VeryLazy",
    keys = {
      { "s",   mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",   mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",   mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",   mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "c-s", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    }
  }),

  -- telescope
  config({
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      'plenary',
      'devicons',
      'nvim-telescope/telescope-fzy-native.nvim',
    }
  }, 'telescope'),

  -- lsp
  {
    'folke/lazydev.nvim',
    ft = 'lua',
  },
  {
    'Bilal2453/luvit-meta',
    lazy = true
  },
  config({
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  }, 'lsp'),
  'Bekaboo/dropbar.nvim',
  config({
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'treesitter',
      'devicons'
    }
  }, 'lspsaga'),
  setup({ 'j-hui/fidget.nvim' }),
  config({ 'mfussenegger/nvim-lint' }, 'nvim-lint'),

  -- completion
  config({
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 100,
    dependencies = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
      'saadparwaiz1/cmp_luasnip'
    }
  }, 'completion'),

  -- visual
  config({ 'Mofiqul/vscode.nvim' }, 'vscode'),
  config({
    'akinsho/bufferline.nvim',
    branch = 'main',
    requires = 'devicons'
  }, 'bufferline'),
  config({ 'luukvbaal/statuscol.nvim' }, 'statuscol'),
  setup({ 'nvim-lualine/lualine.nvim' }),
  config({
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' }
  }, 'folds'),
  config({
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = { 'css', 'conf', 'lua' }
    }
  }),
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim',
    }
  },
  setup({
    'MeanderingProgrammer/markdown.nvim',
    dependencies = {
      'treesitter',
      'devicons'
    }
  }),
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install"
  },

  -- navigation
  config({ 'mrjones2014/smart-splits.nvim' }, 'splits'),
  config({
    dir = '~/dev/contrib/neo-tree.nvim',
    dependencies = {
      'devicons',
      'MunifTanjim/nui.nvim'
    },
  }, 'neo-tree'),
})
