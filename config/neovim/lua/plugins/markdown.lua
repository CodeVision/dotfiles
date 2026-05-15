require("render-markdown").setup({
  nested = false,
  checkbox = {
    enabled = true,
    custom = {
      cancelled = {
        raw = '[/]',
        rendered = '✘ ',
        highlight = 'RenderMarkdownChecked',
        scope_highlight = nil
      },
      todo = {
        raw = '[-]',
        rendered = '⏳ ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil
      },
      postponed = {
        raw = '[~]',
        rendered = '⏰ ',
        highlight = 'RenderMarkdownTodo',
        scope_highlight = nil
      },
    }
  },
  completions = {
    lsp = { enabled = true }
  },
  code = {
    language_name = true
  },
  yaml = {
    enabled = false
  }
})
-- require("markview").setup({
--   preview = {
--     icon_provider = "devicons"
--   },
--   list_items = {
--     shift_width = 0
--   }
-- })
--
-- require("markview.extras.editor").setup();
