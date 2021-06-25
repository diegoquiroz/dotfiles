--
-- nvim-tree.lua
--
vim.g.nvim_tree_width = 25
vim.g.nvim_tree_indent_markers = 1
--vim.g.nvim_tree_lsp_diagnostics = 1
--vim.g.nvim_tree_show_icons = {
--    git = 1,
--    folders = 1,
--    files = 1
--}

vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        symlink = "",
        empty = "",
        empty_open = "",
        symlink_open = ""
    }
}
vim.api.nvim_set_keymap('n', '<Leader>op', ':NvimTreeToggle<CR>', {})
