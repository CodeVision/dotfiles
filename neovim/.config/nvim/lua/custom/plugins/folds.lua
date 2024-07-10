-- folds
local options = vim.opt
options.foldcolumn = '1'
options.foldlevel = 99
options.foldlevelstart = 99
options.foldenable = true
options.fillchars = [[eob: ,fold: ,foldopen:⮟,foldsep: ,foldclose:⮞]]

local ufo = require('ufo')

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
vim.keymap.set('n', 'K', function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    -- vim.lsp.buf.hover()
    vim.cmd [[ Lspsaga hover_doc ]]
  end
end)

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local totalLines = vim.api.nvim_buf_line_count(0)
  local foldedLines = endLnum - lnum
  local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)

  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  local rAlignAppndx = math.max(math.min(vim.api.nvim_win_get_width(0), width - 1) - curWidth - sufWidth - 3, 0)
  suffix = " ⋯ " .. (" "):rep(rAlignAppndx) .. suffix
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

ufo.setup({
  open_fold_hl_timeout = 400,
  close_fold_kinds_for_ft = { 'imports', 'comment'},
  preview = {
    win_config = {
      border = { "", "-", "", "", "", "-", "", ""},
      winblend = 0
    },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      jumpTop = "[",
      jumpBot = "]",
    }

  },
  provider_selector = function (--[[ bufnr, filetype, buftype ]])
    return { 'treesitter', 'indent' }
  end,
  enable_get_fold_virt_text = true,
  fold_virt_text_handler = handler,
})
