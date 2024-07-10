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
    disable = function(_, buf)
      local max_filesize = 10 * 1024 * 1024 -- 10 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = { "ruby" }
  },
  endwise = {
    enable = true
  }
})
