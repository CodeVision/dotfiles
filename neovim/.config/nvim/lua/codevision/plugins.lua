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

local load_config = function(name)
  local success, conf = pcall(require, 'codevision.plugins.' .. name)
  if success then
    return conf
  end
end

local startup = function(use)
  --  plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- files
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    tag = '0.1.0',
    config = load_config('telescope-nvim'),
  }
  use { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }
  use {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup({}) end
  }

  -- coding
  use {
    'AndrewRadev/splitjoin.vim',
    keys = { "gJ", "gS" }
  }
  use {
    'numToStr/Comment.nvim',
    config = function() require("Comment").setup({}) end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = load_config('nvim-treesitter')
  }
  --  use { 'nvim-treesitter/playground' }
  --  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- completion
  use { 'hrsh7th/nvim-cmp', config = load_config('nvim-cpm') }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

  use {
    'neovim/nvim-lspconfig',
    config = load_config('lsp'),
  }
  use 'onsails/lspkind.nvim'
  use {
    'glepnir/lspsaga.nvim',
    config = load_config('lspsaga-nvim')
  }
  --  use {
  --    'j-hui/fidget.nvim',
  --    config = function() require('fidget').setup({}) end
  --  }
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = load_config('nvim-ufo'),
  }

  -- interface
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      use 'nvim-tree/nvim-web-devicons',
      use 'MunifTanjim/nui.nvim'
    },
    branch = 'v2.x',
    config = load_config('neo-tree-nvim')
  }
  use {
    'mrjones2014/smart-splits.nvim',
    config = load_config('smart-splits-nvim')
  }
  use {
    'Mofiqul/vscode.nvim',
    config = load_config('vscode-nvim')
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end

return require('packer').startup({
  startup
})
