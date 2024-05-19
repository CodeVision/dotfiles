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
  plugin.config = function()
    local success = pcall(require, "custom.plugins." .. name)
    if not success then
      print("failed to load config for: " .. name)
    end
  end
  return plugin
end

local setup = function(plugin)
  plugin.opts = {}
  return plugin
end

require("lazy").setup({
  { name = 'plenary', 'nvim-lua/plenary.nvim' },
  { name = 'devicons', 'nvim-tree/nvim-web-devicons' },

  -- formatting
  setup({
    'kylechui/nvim-surround',
    version = "*",
    event = "VeryLazy",
  }),
  config({
    'Wansmer/treesj',
    keys = { 'gM', 'gJ', 'gS' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  }, 'formatting'),
  'RRethy/nvim-treesitter-endwise',

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- telescope
  config({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      'plenary',
      'devicons',
      'nvim-telescope/telescope-fzy-native.nvim',
    }
  }, 'telescope'),

  -- lsp
  config({
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/neodev.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  }, 'lsp'),
  setup({ 'j-hui/fidget.nvim' }),

  -- completion
  config({
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 100,
    dependencies = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer'
    }
  }, 'completion'),

  -- visual
  config({ 'Mofiqul/vscode.nvim' }, 'visual'),

  -- splits
  config({ 'mrjones2014/smart-splits.nvim' }, 'splits')
})
