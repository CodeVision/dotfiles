vim.api.nvim_set_hl(0, '@text.title.1.markdown', { link = "@attribute" })
vim.api.nvim_set_hl(0, '@text.title.2.markdown', { link = "@label" })
vim.api.nvim_set_hl(0, '@text.title.3.markdown', { link = "@constant" })
vim.api.nvim_set_hl(0, '@text.title.4.markdown', { link = "@string" })
vim.api.nvim_set_hl(0, '@text.title.5.markdown', { link = "@label" })
vim.api.nvim_set_hl(0, '@text.title.6.markdown', { link = "@constructor" })

vim.api.nvim_set_hl(0, '@headings.h1.marker.markdown', { link = "@attribute" })
vim.api.nvim_set_hl(0, '@headings.h2.marker.markdown', { link = "@label" })
vim.api.nvim_set_hl(0, '@headings.h3.marker.markdown', { link = "@constant" })
vim.api.nvim_set_hl(0, '@headings.h4.marker.markdown', { link = "@string" })
vim.api.nvim_set_hl(0, '@headings.h5.marker.markdown', { link = "@label" })
vim.api.nvim_set_hl(0, '@headings.h6.marker.markdown', { link = "@constructor" })

vim.keymap.set("n", "<c-space>", function()
  local node = vim.treesitter.get_node()
  if node ~= nil then
    local root = node:tree():root()

    local parent = node:parent()
    while parent ~= nil and parent ~= root and parent:type() ~= "list_item" do
      parent = parent:parent()
    end

    if parent ~= nil then
      if parent:named_child_count() > 1 and parent:named_child(1):type():sub(0, 16) == "task_list_marker" then
        local checkmark = parent:named_child(1)
        if checkmark ~= nil then
          local current = vim.treesitter.get_node_text(checkmark, 0)
          local row, col = checkmark:start()

          local replacement = "[ ]"
          if current:sub(2, 2) ~= "x" then
            replacement = "[x]"
          end
          vim.api.nvim_buf_set_text(0, row, col, row, col + 3, { replacement })
        end
      end
    end
  end
end, { buffer = true })
