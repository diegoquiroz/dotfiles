--
-- nvim-tree.lua
--
require('nvim-tree').setup{
  renderer = {
    indent_markers = {
      enable = true
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      }
    }
  }
}
vim.g.nvim_tree_width = 25
--vim.g.nvim_tree_lsp_diagnostics = 1
--vim.g.nvim_tree_show_icons = {
--    git = 1,
--    folders = 1,
--    files = 1
--}

vim.api.nvim_set_keymap('n', '<Leader>op', ':NvimTreeToggle<CR>', {})
