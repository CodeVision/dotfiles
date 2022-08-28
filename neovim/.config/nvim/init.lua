require('plugins')

require('diagnostics')
require('mappings')

-- default options
local opts = vim.opt

opts.number = true              -- show line numbers
opts.relativenumber = true      -- use relative line numbers

opts.textwidth = 100

--[[ add to toggle
opts.cursorline = true
--]]

opts.swapfile = false           -- disable swap files

opts.showmatch = true           -- briefly jump to matching bracket on insertion
opts.matchtime = 2              -- duration to show the matching bracket for

opts.splitbelow = true          -- new splits go to the bottom
opts.splitright = true          -- new splits go to the right

opts.mouse = a                  -- enable mouse in all modes

opts.listchars = { tab = '▸ ', eol = '¬', extends = '❯', precedes = '❮', trail = '·', nbsp = '·' }
opts.showbreak = '↪'

opts.signcolumn = 'auto:1-3'

-- indentations / spacings
opts.expandtab = true           -- insert spaces for tabs
opts.shiftwidth = 4             -- number of spaces to shift by
opts.softtabstop = 4            -- number of spaces tab counts for while performing edits
opts.tabstop = 4                -- number of spaces tab counts for

-- completions
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- graphics
opts.termguicolors = true
