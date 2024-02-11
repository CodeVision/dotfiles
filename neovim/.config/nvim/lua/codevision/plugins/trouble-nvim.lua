require('trouble').setup({})

vim.keymap.set("n", "<leader>dx", "<cmd>TroubleToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>TroubleToggle loclist<cr>", { silent = true })
vim.keymap.set("n", "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true })
