-- local telescope = require("telescope")
--
-- telescope.setup({
--   defaults = {
--     layout_config = {
--       preview_width = 0.5
--     }
--   }
-- })
-- telescope.load_extension('fzy_native')
--
--
-- local builtin = require("telescope.builtin")
--
-- vim.keymap.set("n", "<leader>ff", builtin.git_files)
-- vim.keymap.set("n", "<c-p>", builtin.find_files)
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep)
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags)
local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    backdrop = 85,
  },
  fzf_opts = {
    ["--layout"] = "default"
  },
  keymap = {
    builtin = {
      ["<c-d>"] = "preview-page-down",
      ["<c-u>"] = "preview-page-up",
      ["<c-v>"] = "toggle-preview"
    },
    fzf = {
      ["ctrl-a"] = "toggle-all",
      ["ctrl-t"] = "first",
      ["ctrl-g"] = "last",
      ["ctrl-p"] = "up",
      ["ctrl-n"] = "down",
    }
  },
  files = {
    hidden = false
  }
})
fzf.register_ui_select()


vim.keymap.set("n", "<leader>ff", fzf.git_files)
vim.keymap.set("n", "<c-p>", fzf.files)
vim.keymap.set("n", "<leader>fo", function ()
  fzf.files({ cwd = "~/data/orgfiles/", previewer = "bat" })
end)
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fh", fzf.help_tags)
