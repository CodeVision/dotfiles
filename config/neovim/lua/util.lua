local random = math.random

local uuid = function()
  math.randomseed(os.time())
  local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function(c)
    local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
    return string.format('%x', v)
  end)
end

local get_au_groups = function()
  local groups = {}
  for _, ac in ipairs(vim.api.nvim_get_autocmds({})) do
    if ac.group_name then
      groups[ac.group_name] = true
    end
  end

  return vim.tbl_keys(groups)
end

local reload = require("plenary.reload").reload_module
local path = require("plenary.path")
vim.keymap.set('n', '<leader><leader>r', function ()
  local wd = vim.fn.getcwd()

  local file = path:new(wd, "lua")
  local plugin_name = vim.fn.readdir(file:expand())[1]

  local au_groups = get_au_groups()
  for _, group in ipairs(au_groups) do
    if string.sub(group, 1, #plugin_name) == plugin_name then
      vim.api.nvim_del_augroup_by_name(group)
    end
  end

  reload(plugin_name)

  require(plugin_name)
end)

return {
  uuid = uuid
}
