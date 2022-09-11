-- folds
local options = vim.opt
options.foldcolumn = '1'
options.foldlevel = 99
options.foldlevelstart = 99
options.foldenable = true
options.fillchars = [[eob: ,fold: ,foldopen:⮟,foldsep:|,foldclose:⮞]]

local ufo = require('ufo')

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
vim.keymap.set('n', 'K', function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

ufo.setup({
  provider_selector = function (--[[ bufnr, filetype, buftype ]])
    return { 'treesitter', 'indent' }
  end
})


