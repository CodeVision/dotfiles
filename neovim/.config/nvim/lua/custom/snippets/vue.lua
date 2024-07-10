local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("vue", {
  s("sfc", fmt([[
  <template>
    {}
  </template>

  <script>
  export default {{

  }}
  </script>

  <style>
  </style>
  ]], {
    i(0)
  })),
})
