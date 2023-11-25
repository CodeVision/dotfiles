require('codevision.options')
require('codevision.mappings')
require('codevision.config')

require('codevision.util')
require('codevision.plugins')
require('codevision.diagnostics')

if vim.g.neovide then
  require('codevision.gui')
end
