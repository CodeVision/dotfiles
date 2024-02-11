local dorkmode = require('dorkmode')

dorkmode.setup({
  base_dir = '~/data/notes',
  file_ext = '.md',
  dashboard = {
    keybind = "<leader>n",
    list = {
      {
        name = "journal",
        dir = "Personal/Journal",
        type = "daily",
        keybind = "t"
      },
      {
        name = "devlog",
        dir = "Devlog",
        type = "daily",
        keybind = "d"
      },
      {
        name = "note",
        dir = "Inbox",
        keybind = "n"
      }
    }
  },
  templates = {
    dir = ".templates/",
    list = {
      {
        dir = "Personal/Journal/Daily",
        template = "Journal/daily.md"
      }
    }
  }
  -- workspace = {
  --   default_workspace = "personal",
  --   workspaces = {
  --     ["*"] = { "References", "Tech", "Templates", "DevLog" },
  --     personal = { "Personal", "Journal" },
  --     work = { "Work/mkb" }
  --   }
  -- }
})
