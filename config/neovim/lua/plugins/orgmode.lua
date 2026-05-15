require('orgmode').setup({
  org_agenda_files = "~/data/orgfiles/**/*",
  org_default_notes_file = "~/data/orgfiles/refile.org",
  org_todo_keywords = {
    'TODO(t)', 'NEXT', 'WAITING', '|', 'DONE', 'CANCELLED', 'HOLD'
  },
  org_startup_folded = "inherit"
})
