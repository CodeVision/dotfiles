local options = vim.opt

options.number = true
options.relativenumber = true

options.textwidth = 100

options.swapfile = false

options.showmatch = true -- briefly jump to matching bracket on insertion
options.matchtime = 2

options.splitbelow = true -- new splits go to the bottom
options.splitright = true -- new splits to to the right

options.listchars = { tab = '▸ ', eol = '¬', extends = '❯', precedes = '❮', trail = '·', nbsp = '·' }
options.showbreak = '↪'

options.signcolumn = 'auto:2-3'
options.pumheight = 8

-- indentations / spacings
options.expandtab = true
options.shiftwidth = 2
options.softtabstop = 2
options.tabstop = 2

-- command completions
options.wildmenu = true
options.wildmode = 'full'

-- completions

-- graphics
options.termguicolors = true

options.conceallevel = 2
