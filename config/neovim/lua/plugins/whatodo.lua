require('whatodo').setup({
  templates = {
    {
      name = "Quick Note",
      directory = "~/data/notes/Inbox/quick",
      filename_pattern = "quick-%Y%m%d-%H%M%S.md",
      content = "# Quick Note\n\nDate: " .. os.date("%Y-%m-%d %H:%M") .. "\n\n",
    },
    {
      name = "Meeting Notes",
      directory = "~/data/notes/meetings",
      filename_pattern = "meeting-%Y%m%d.md",
      content = "# Meeting Notes\n\nDate: " .. os.date("%Y-%m-%d %H:%M") .. "\nAttendees: \n\n## Agenda\n\n- \n\n## Notes\n\n\n## Action Items\n\n- [ ] \n",
    }
  },
  notes = {
    refile_directory = '~/data/notes',
  },
  todo = {
    root_dir = '~/data/todo',
    capture_file = '~/data/todo/refile.wtd',
    states = {
      { name = 'TODO',      key = 't' },
      { name = 'NEXT',      key = 'n' },
      { name = 'PROGRESS',  key = 'p' },
      { name = 'WAITING',   key = 'w',},
      { name = 'DONE',      key = 'd', end_state = true },
      { name = 'CANCELLED', key = 'c', end_state = true },
    },
    end_state_visible_days = 3,
    deadline_soon_days = 14,
    keymaps = {
      schedule = '<leader>ts',
      deadline = '<leader>td',
      state = '<leader>tt',
    },
  },
  prompt_for_filename = false,
  keymaps = {
    refile = '<leader>wr',
  },
  pomodoro = {
    work_duration  = 25,
    break_duration = 5,
    keymaps = {
      start  = '<leader>ps',
      stop   = '<leader>pq',
      resume = '<leader>pr',
    },
  },
  journal = {
    base_dir = '~/data/notes/Personal/Journal/',
    keymaps = {
      prev    = '[j',
      next    = ']j',
      current = '<leader>wc',
      pull    = '<leader>wo',
      refile  = '<leader>wr',
    },
    goto = {
      daily     = '<leader>jd',
      weekly    = '<leader>jw',
      monthly   = '<leader>jm',
      quarterly = '<leader>jq',
      yearly    = '<leader>jy',
    },
  },
})

vim.keymap.set('n', '<leader>n', '<cmd>WhatodoNew<cr>', { desc = 'New note from template' })
vim.keymap.set('n', '<leader>jt', '<cmd>WhatodoJournal<cr>', { desc = 'Open journal' })
vim.keymap.set('n', '<leader>wa', '<cmd>WhatodoAgenda<cr>', { desc = 'Open WhatodoAgenda'})
vim.keymap.set('n', '<leader>wt', '<cmd>WhatodoTodos<cr>', { desc = 'Open WhatodoTodos' })
vim.keymap.set('n', '<leader>wn', '<cmd>WhatodoTodo<cr>', { desc = 'Open Whatodo Capture' })
