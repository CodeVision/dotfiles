-- default options
local options = vim.opt

options.number = true              -- show line numbers
options.relativenumber = true      -- use relative line numbers

options.textwidth = 100

--[[ add to toggle
opts.cursorline = true
--]]

options.swapfile = false           -- disable swap files

options.showmatch = true           -- briefly jump to matching bracket on insertion
options.matchtime = 2              -- duration to show the matching bracket for

options.splitbelow = true          -- new splits go to the bottom
options.splitright = true          -- new splits go to the right

options.mouse = a                  -- enable mouse in all modes

options.listchars = { tab = '▸ ', eol = '¬', extends = '❯', precedes = '❮', trail = '·', nbsp = '·' }
options.showbreak = '↪'

options.signcolumn = 'auto:1-3'
options.pumheight = 8

-- indentations / spacings
options.expandtab = true           -- insert spaces for tabs
options.shiftwidth = 2             -- number of spaces to shift by
options.softtabstop = 2            -- number of spaces tab counts for while performing edits
options.tabstop = 2                -- number of spaces tab counts for

-- completions
options.completeopt = { 'menu', 'menuone', 'noselect' }

-- graphics
options.termguicolors = true
