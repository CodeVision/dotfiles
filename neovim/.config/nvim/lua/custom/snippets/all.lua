local ls = require('luasnip')

local s = ls.s
local f = ls.function_node

ls.add_snippets('all', {
  s(
    'curtime',
    f(function()
      return os.date('!%Y-%m-%dT%H:%M:%S.000Z', os.time())
    end)
  ),
  s('curepoch', f(function() return os.time() end)),
  s('uuid', f(function()
    local result = vim.system({ 'uuidgen' }, { text = true }):wait()
    return result.stdout:sub(1, -2)
  end))
})
