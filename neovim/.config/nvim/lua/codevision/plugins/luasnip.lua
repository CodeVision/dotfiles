local ls = require('luasnip')

ls.config.set_config({
  history = true,
})

--  press <Tab> to expand or jump in a snippet. These can also be mapped separately
--  via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
vim.keymap.set("i", "<Tab>", function()
  if ls.expand_or_jumpable() then
    return "<Plug>luasnip-expand-or-jump"
  else
    return "<Tab>"
  end
end, { silent = true, expr = true })

-- -1 for jumping backwards.
vim.keymap.set({"i", "s"}, "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<cr>", { silent = true })
vim.keymap.set("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", { silent = true })

vim.keymap.set({"i", "s"}, "<c-e>", function()
  if ls.choice_active() then
    return "<Plug>luasnip-next-choice"
  else
    return "<c-e>"
  end
end, { silent = true, expr = true })

vim.keymap.set("n", "<leader>sr", "<cmd>source ~/.config/nvim/lua/codevision/plugins/snippets/init.lua<CR>")

require('codevision.snippets')
