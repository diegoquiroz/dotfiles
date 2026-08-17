-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ","
vim.opt.swapfile = false

vim.filetype.add({
  extension = {
    jinja = "htmldjango",
    jinja2 = "htmldjango",
    j2 = "htmldjango",
  },
})

-- LSP Server to use for Python.
--vim.g.lazyvim_python_lsp = "basedpyright"

vim.opt.laststatus = 3

require("config.formatters")
vim.g.editorconfig = true

vim.opt.colorcolumn = "80"

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
