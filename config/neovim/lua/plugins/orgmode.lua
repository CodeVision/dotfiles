require('orgmode').setup({
  org_agenda_files = "~/data/orgfiles/**/*",
  org_default_notes_file = "~/data/orgfiles/refile.org",
  org_todo_keywords = {
    'TODO(t)', 'NEXT', 'PROGRESS', 'WAITING', '|', 'DONE', 'CANCELLED'
  },
  org_startup_folded = "inherit"
})

require("org-super-agenda").setup({
  org_default_notes_file = { "~/data/orgfiles/refile.org" },
  org_directories = { "~/data/orgfiles/" },
  todo_states = {
    { name='TODO',      keymap='ot', color='#FF5555', strike_through=false, fields={'todo'} },
    { name='NEXT',      keymap='on', color='#FFAA00', strike_through=false, fields={'todo'} },
    { name='PROGRESS',  keymap='op', color='#FAEA82', strike_through=false, fields={'todo'} },
    { name='WAITING',   keymap='ow', color='#BD93F9', strike_through=false, fields={'todo'} },
    { name='DONE',      keymap='od', color='#50FA7B', strike_through=true,  fields={'todo'} },
    { name='CANCELLED', keymap='oc', color='#999999', strike_through=true,  fields={'todo'} },
  },
})

vim.api.nvim_set_hl(0, 'OrgSA_Group', {
  fg = '#8BE9FD',
  bold = true,
})

vim.keymap.set('n', '<leader>ow', '<cmd>OrgSuperAgenda<cr>')
vim.keymap.set('n', '<leader>oW', '<cmd>OrgSuperAgenda!<cr>') -- fullscreen
