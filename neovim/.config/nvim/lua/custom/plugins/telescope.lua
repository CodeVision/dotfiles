local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_config = {
      preview_width = 0.5
    }
  }
})
telescope.load_extension('fzy_native')


local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.git_files)
vim.keymap.set("n", "<c-p>", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
