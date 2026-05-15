require('whatodo').setup({
  -- Set to true to prompt for filename instead of auto-generating
  prompt_for_filename = false,

  templates = {
    {
      name = "Quick Note",
      directory = "~/data/notes/Inbox/",
      filename_pattern = "quick-%Y%m%d-%H%M%S.md",
      content = "# Quick Note\n\nDate: " .. os.date("%Y-%m-%d %H:%M") .. "\n\n",
      filetype = "markdown",
    },
    {
      name = "Meeting Notes",
      directory = "~/data/notes/Inbox/meetings/",
      filename_pattern = "meeting-%Y%m%d.md",
      content = "# Meeting Notes\n\nDate: " .. os.date("%Y-%m-%d %H:%M") .. "\nAttendees: \n\n## Agenda\n\n- \n\n## Notes\n\n\n## Action Items\n\n- [ ] \n",
      filetype = "markdown",
    },
  },
  planning = {
    base_dir = '~/data/notes/Planning',
    keymaps = {
      prev    = '<leader>pp',
      next    = '<leader>pn',
      current = '<leader>pc',
      pull    = '<leader>po',
    },
  },
})

vim.keymap.set('n', '<leader>n', '<cmd>WhatodoNew<cr>', { desc = 'New note from template' })
vim.keymap.set('n', '<leader>p', '<cmd>WhatodoPlan<cr>', { desc = 'Open planning' })
