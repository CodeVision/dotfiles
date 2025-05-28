local hl_disabled_langs = { 'csv' }

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
    gohtml = 'gotmpl',
    gohtmltmpl = 'gotmpl',
    gohtxtmpl = 'gotmpl',
    gohtexttmpl = 'gotmpl',
  }
})


---@diagnostic disable-next-line:missing-fields
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "go",
    "markdown",
    "markdown_inline"
  },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      if vim.list_contains(hl_disabled_langs, lang) then
        return true
      end

      local max_filesize = 10 * 1024 * 1024 -- 10 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
      return false
    end,
    additional_vim_regex_highlighting = { "ruby" }
  },
  indent = {
    enable = true,
    disable = function(lang)
      local enabled_langs = { "vue" }
      return not vim.list_contains(enabled_langs, lang)
    end
  }
})
