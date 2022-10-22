local vscode = require('vscode')
vscode.setup({
  italic_comments = true,
  disable_nvimtree_bg = true
})

-- local function setStyle()
--   local print = _G.print
--   _G.print = function() end
--   vscode.change_style('dark')
--   _G.print = print
-- end
--
-- setStyle()

vim.cmd('colorscheme vscode')
