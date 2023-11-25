vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<cr>')

require('neo-tree').setup({
  sources = {
    "filesystem",
    "buffers",
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function (arg)
        vim.opt_local.relativenumber = true
      end
    }
  }
})

-- vim.cmd([[
-- highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
-- highlight! link NeoTreeDirectoryName NvimTreeFolderName
-- highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
-- highlight! link NeoTreeRootName NvimTreeRootFolder
-- highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
-- highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
-- highlight NeotreeTitleBar guifg=#ffffff guibg=#00ff00
-- ]])
