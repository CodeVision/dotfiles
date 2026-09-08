local wd = require("zellij-pane-wd")

vim.keymap.set("n", "<leader>wh", wd.left)
vim.keymap.set("n", "<leader>wj", wd.down)
vim.keymap.set("n", "<leader>wk", wd.up)
vim.keymap.set("n", "<leader>wl", wd.right)
