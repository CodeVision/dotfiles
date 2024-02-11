local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets("go", {
  s("iferrnil", fmt([[
  if err != nil {{
  	{}
  }}
  ]], {
    i(0)
  }))
}, { key = "lua-snippets-go" })
