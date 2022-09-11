require('telescope').setup({
  defaults = {
    color_devicons = true,
    layout_config = {
      preview_width = 0.65
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true
    }
  }
})
require('telescope').load_extension('fzy_native')

local keymap = vim.keymap.set

local builtin = require('telescope.builtin')
keymap('n', '<c-p>', builtin.find_files, { silent = true })
keymap('n', '<leader>ff', builtin.git_files, { silent = true })
keymap('n', '<leader>fg', builtin.live_grep, { silent = true })
keymap('n', '<leader>fh', builtin.help_tags, { silent = true })