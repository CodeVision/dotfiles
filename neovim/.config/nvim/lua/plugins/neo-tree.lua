local path = require('plenary.path')
vim.keymap.set('n', '<leader>ee', '<cmd>Neotree toggle<cr>')

local sort_items = require('neo-tree.sources.common.file-items').sort_items

local read_json = function(filepath)
  if vim.fn.filereadable(filepath) == 1 then
    local contents = vim.fn.readfile(filepath)

    return vim.fn.json_decode(contents)
  end
end

local function index(item, t)
  for i, value in ipairs(t) do
    if value == item then
      return i
    end
  end
  return -1
end

local function fixed_order_sorter(order_file)
  local success, result = pcall(read_json, order_file)
  if not success then
    return sort_items
  end

  local order = result
  local cwd = vim.fn.getcwd()
  return function(a, b)
    local rel_path_a = path:new(a.path):make_relative(cwd)
    local rel_path_b = path:new(b.path):make_relative(cwd)

    local index_a = index(rel_path_a, order)
    local index_b = index(rel_path_b, order)

    if index_a >= 0 and index_b >= 0 then
      return index_a < index_b
    elseif index_a >= 0 then
      return true
    elseif index_b >= 0 then
      return false
    end

    return sort_items(a, b)
  end
end

require('neo-tree').setup({
  close_if_last_window = true,
  sources = {
    "filesystem",
    "buffers",
    -- "basic",
    -- "aws-cdk"
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.opt_local.relativenumber = true
      end
    }
  },
  filesystem = {
    sort_function = function(a, b)
      local order_file = vim.fn.getcwd() .. "/.neo-tree"
      if vim.fn.filereadable(order_file) == 1 then
        return fixed_order_sorter(order_file)(a, b)
      else
        if a.type == b.type then
          return a.path < b.path
        else
          return a.type < b.type
        end
      end
    end
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
