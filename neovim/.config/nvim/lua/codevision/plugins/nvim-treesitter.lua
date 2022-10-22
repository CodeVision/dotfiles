require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "lua",
    "python",
    "ruby",
    "rust",
    "typescript",
    "vue",
  },
  auto_install = true,

  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 10 * 1024 * 1024 -- 10 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end
  }
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
