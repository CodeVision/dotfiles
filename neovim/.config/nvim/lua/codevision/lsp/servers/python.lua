local capabilities = require('codevision.lsp.util').capabilities

local function executable()
  return vim.env.NEOVIM_PYTHON .. '/bin/pylsp'
end

local function python_path()
  local venv = vim.env.VIRTUAL_ENV
  local ppath = vim.g.python3_host_prog
  if venv ~= nil then
    ppath = venv .. '/bin/python'
  end
  return ppath
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
    local exe = executable()
    if vim.fn.executable(exe) == 1 then
      vim.lsp.start({
        name = 'Python Language Server',
        cmd = { exe },
        root_dir = vim.fs.dirname(vim.fs.find({
          'pyproject.toml',
          'setup.py',
          'setup.cfg',
          'requirements.txt',
          'Pipfile'
        }, { upward = true })[1]),
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              -- formatter options
              -- black = { enabled = true },
              -- autopep8 = { enabled = false },
              -- yapf = { enabled = false },
              -- linter options
              -- pylint = { enabled = true, executable = "pylint" },
              -- ruff = { enabled = false },
              -- pyflakes = { enabled = false },
              -- pycodestyle = { enabled = false },
              -- type checker
              pylsp_mypy = {
                enabled = true,
                overrides = { "--python-executable", python_path(), true },
                report_progress = true,
                live_mode = false
              },
              -- auto-completion options
              -- jedi_completion = { fuzzy = true },
              -- import sorting
              -- isort = { enabled = true },
            },
          },
        }
      })
    end
  end
})
