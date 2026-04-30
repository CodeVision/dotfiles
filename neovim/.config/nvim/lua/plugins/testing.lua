local neotest = require("neotest")

-- local neotest_ns = vim.api.nvim_create_namespace("neotest")
-- vim.diagnostic.config({
-- })

neotest.setup({
  adapters = {
    require("neotest-golang")({
      runner = "gotestsum"
    })
  }
})

vim.keymap.set({ 'n' }, '<leader>tt', neotest.run.run)
vim.keymap.set({ 'n' }, '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set({ 'n' }, '<leader>td', function() neotest.run.run({ strategy = "dap" }) end)
vim.keymap.set({ 'n' }, '<leader>ts', neotest.run.stop)
vim.keymap.set({ 'n' }, '<leader>ta', neotest.run.attach)
vim.keymap.set({ 'n' }, '<leader>to', neotest.output.open)
vim.keymap.set({ 'n' }, '<leader>tp', neotest.output_panel.toggle)
vim.keymap.set({ 'n' }, '<leader>ts', neotest.summary.toggle)

