-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  -- command = "tabstop=4 shiftwidth=4",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.smarttab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     -- vim.opt_local.expandtab = true
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.blade.php",
  callback = function()
    vim.opt_local.filetype = "blade"
  end,
})
