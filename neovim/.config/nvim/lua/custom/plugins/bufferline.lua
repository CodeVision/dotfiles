local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "ordinal",
    offsets = {
      { filetype = 'neo-tree', text = 'File explorer', separator = true, text_align = 'left' }
    }
  },
  highlights = {
    background = {
      fg = '#7f7f7f'
    },
    numbers = {
      fg = '#7f7f7f'
    },
    close_button = {
      fg = '#7f7f7f'
    },
    offset_separator = {
      bg = '#111111'
    }
  }
})

local go = function(buf)
  return function()
    require("bufferline").go_to(buf, true)
  end
end

vim.keymap.set('n', '1<leader>b', go(1))
vim.keymap.set('n', '2<leader>b', go(2))
vim.keymap.set('n', '3<leader>b', go(3))
vim.keymap.set('n', '4<leader>b', go(4))
vim.keymap.set('n', '5<leader>b', go(5))
vim.keymap.set('n', '6<leader>b', go(6))
vim.keymap.set('n', '7<leader>b', go(7))
vim.keymap.set('n', '8<leader>b', go(8))
vim.keymap.set('n', '9<leader>b', go(9))
vim.keymap.set('n', '0<leader>b', go(-1))

vim.keymap.set('n', '<leader>bq', ':Bdelete<cr>')
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>')
