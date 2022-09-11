local ls = require("luasnip")

local ps = ls.parser.parse_snippet

local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets("javascript", {
  ps("caf", "const $1 = $2 => {\n  $0\n};"),
  s("req", fmt("const {} = require('{}');", {
    i(0, "r"),
    i(1)
  })),
  ps("cl", "console.log('$0');"),
  s("describe", fmt([[
  describe("{}", () => {{
    {}
  }});
  ]], {
    d(1, function(_, parent)
        local source_name = vim.split(parent.snippet.env.TM_FILENAME, '.', true)
        return sn(nil, {
          i(1, source_name[1])
        })
      end),
    i(0)
  })),
  s("it", fmt([[
  it("{}", async () => {{
    {}
  }});
  ]], {
    i(1),
    i(0)
  }))
}, { key = "lua-snippets-javascript" })