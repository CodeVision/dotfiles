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
    config = load_config('telescope-nvim')
  }
  use { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }
 --
 --  -- coding
 --  use {
 --    "windwp/nvim-autopairs",
 --    config = function() require("nvim-autopairs").setup({}) end
 --  }
 --  use {
 --    "kylechui/nvim-surround",
 --    config = function() require("nvim-surround").setup({}) end
 --  }
 --  use {
 --    'AndrewRadev/splitjoin.vim',
 --    keys = { "gJ", "gS" }
 --  }
 --  use 'NvChad/nvim-colorizer.lua'
 use {
   'numToStr/Comment.nvim',
   config = function() require("Comment").setup({}) end
 }
 --  use 'gpanders/editorconfig.nvim'
 --  -- use {
 --  --   'nvim-neotest/neotest',
 --  --   requires = {
 --  --     'nvim-lua/plenary.nvim',
 --  --     'nvim-treesitter/nvim-treesitter',
 --  --     'antoinemadec/FixCursorHold.nvim',
 --  --     'haydenmeade/neotest-jest'
 --  --   }
 --  -- }
 --  use {
 --    'folke/trouble.nvim',
 --    requires = 'nvim-tree/nvim-web-devicons',
 --  }
 --
 --  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
 --  use {
 --    'nvim-treesitter/nvim-treesitter',
 --    run = ':TSUpdate',
 --  }
 --  use { 'nvim-treesitter/playground' }
 --
 --  use 'neovim/nvim-lspconfig'
 --  use 'jose-elias-alvarez/null-ls.nvim'
 --  use 'onsails/lspkind.nvim'
 --  use 'glepnir/lspsaga.nvim'
 --  use {
 --    'j-hui/fidget.nvim',
 --    config = function() require('fidget').setup({}) end
 --  }
 --
 --  -- completion
 --  use 'hrsh7th/nvim-cmp'
 --  use 'hrsh7th/cmp-buffer'
 --  use 'hrsh7th/cmp-path'
 --  -- use 'hrsh7th/cmp-nvim-lua'
 --  use 'hrsh7th/cmp-nvim-lsp'
 --
 --  -- snippets
 --  use 'L3MON4D3/LuaSnip'
 --  use 'saadparwaiz1/cmp_luasnip'
 --
 --  -- languages
 --  use 'simrat39/rust-tools.nvim'
 --  use { 'folke/neodev.nvim',
 --    config = function() require('neodev').setup({}) end
 --  }
 --  use 'mattn/emmet-vim'
 --
 --  -- interface
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
 --  use {
 --    'nvim-tree/nvim-tree.lua',
 --    requires = {
 --      'nvim-tree/nvim-web-devicons',
 --    },
 --    tag = 'nightly'
 --  }
 --  use {
 --    'romgrk/barbar.nvim',
 --    requires = {
 --      'nvim-tree/nvim-web-devicons'
 --    },
 --  }
 --  use 'vim-airline/vim-airline'
 --
 --  use 'folke/tokyonight.nvim'
  use {
    'Mofiqul/vscode.nvim',
    config = load_config('vscode-nvim')
  }
 --  use {
 --    'tomasiser/vim-code-dark',
 --    run = 'cp autoload/airline/themes/codedark.vim ../vim-airline/autoload/airline/themes'
 --  }
 -- 
 --  use {
 --    'nvim-tree/nvim-web-devicons',
 --    config = function()
 --      require('nvim-web-devicons').setup({
 --        color_icons = true,
 --        default = true,
 --      })
 --    end
 --  }
 --
 --  -- plugin development
 --  use {
 --    'tpope/vim-scriptease',
 --    cmd = 'Messages'
 --  }
 --  use '/home/codevision/dev/projects/nvim-executioner'
  if packer_bootstrap then
    require('packer').sync()
  end
end

return require('packer').startup({
  startup
})
