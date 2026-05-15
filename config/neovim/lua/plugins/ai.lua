local cc = require("claudecode")

cc.setup({
  terminal = {
    provider = "none"
  }
})

vim.keymap.set({ "n" }, "<leader>ac", "<cmd>ClaudeCode<cr>") -- Toggle Claude" },
vim.keymap.set({ "n" }, "<leader>af", "<cmd>ClaudeCodeFocus<cr>") -- Focus Claude" },
vim.keymap.set({ "n" }, "<leader>ar", "<cmd>ClaudeCode --resume<cr>") -- Resume Claude" },
vim.keymap.set({ "n" }, "<leader>aC", "<cmd>ClaudeCode --continue<cr>") -- Continue Claude" },
vim.keymap.set({ "n" }, "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>") -- Select Claude model" },
vim.keymap.set({ "n" }, "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>") -- Add current buffer" },
vim.keymap.set({ "v" }, "<leader>as", "<cmd>ClaudeCodeSend<cr>") -- Send to Claude" },
-- vim.keymap.set({ "n" }, "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file", ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" }, },
    -- Diff management
vim.keymap.set({ "n" }, "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>") -- Accept diff"
vim.keymap.set({ "n" }, "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>") -- Deny diff"
