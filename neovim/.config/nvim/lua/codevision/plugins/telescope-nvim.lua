return function()
  local telescope = require('telescope')

  local settings = {
    hidden = true,
    no_ignore = false,
  }
  local bind = function(func, args)
    return function() 
      func(args)
    end
  end

  telescope.setup({
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
    },
    pickers = {
      diagnostics = {
        layout_strategy = 'vertical'
      },
      find_files = {
        mappings = {
          i = {
            ["<C-h>"] = function(prompt_bufnr)
              require("telescope.actions").close(prompt_bufnr)
              settings.hidden = not settings.hidden
              require("telescope.builtin").find_files(settings)
            end,
            ["<C-i>"] = function(prompt_bufnr)
              require("telescope.actions").close(prompt_bufnr)
              settings.no_ignore = not settings.no_ignore
              require("telescope.builtin").find_files(settings)
            end
          }
        }
      }
    }
  })
  telescope.load_extension('fzy_native')

  local keymap = vim.keymap.set

  local builtin = require('telescope.builtin')
  keymap('n', '<c-p>', bind(builtin.find_files, settings), { silent = true })
  keymap('n', '<leader>fg', builtin.live_grep, { silent = true })
  keymap('n', '<leader>fh', builtin.help_tags, { silent = true })
end
