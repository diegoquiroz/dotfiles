require('project_nvim').setup{
  silent_chdir = false,
  detection_methods = { "pattern", "lsp" },
}

vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_respect_buf_cwd = 1
