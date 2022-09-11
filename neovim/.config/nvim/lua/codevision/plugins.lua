return require('packer').startup(function(use)
  --  plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- interface
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    tag = 'nightly'
  }
  use {
    'romgrk/barbar.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
  }
  use {
    'tomasiser/vim-code-dark',
    run = 'cp autoload/airline/themes/codedark.vim ../vim-airline/autoload/airline/themes'
  }
  use 'vim-airline/vim-airline'
  use 'christoomey/vim-tmux-navigator'  -- allow seamless navigation between vim windows and tmux panes

  -- files
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = '0.1.0',
  }
  use { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }

  -- coding
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup({}) end
  }
  use {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup({}) end
  }
  use {
    'AndrewRadev/splitjoin.vim',
    keys = { "gJ", "gS" }
  }
  use {
    'numToStr/Comment.nvim',
    config = function() require("Comment").setup() end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'onsails/lspkind.nvim'
  use 'glepnir/lspsaga.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- graphics
  use 'kyazdani42/nvim-web-devicons'
  use 'Mofiqul/vscode.nvim'
end)
