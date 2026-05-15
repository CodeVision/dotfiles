local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("css", {
  s("box-sizing", fmt([[
  html {{
    box-sizing: border-box;
  }}

  *, *:before, *:after {{
    box-sizing: inherit;
  }}
  {}
  ]], {
    i(0)
  })),
})
