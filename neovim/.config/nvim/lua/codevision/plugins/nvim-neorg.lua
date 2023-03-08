local neorg = require('neorg')

neorg.setup({
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true
      }
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      }
    },
    ['core.norg.concealer'] = {
      config = {
        icon_preset = "basic",
        icons = {
          todo = {
            undone = {
              icon = " "
            }
          }
        }
      }
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          home = '~/data/norg/home',
          work = '~/data/norg/work',
          tech = '~/data/norg/tech',
        }
      }
    },
    ['core.norg.esupports.metagen'] = {
      config = {
        type = "auto",
        update_date = true
      }
    }
  }
})
