require("render-markdown").setup({
  completions = {
    lsp = { enabled = true
  }},
  code = {
    language_name = true
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
