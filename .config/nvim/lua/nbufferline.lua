require("bufferline").setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_close_icon = false,
        show_buffer_close_icons = true,
        separator_style = "thin",
        diagnostics = "nvim_lsp"
    }
}

vim.api.nvim_set_keymap('n', '<Leader>b1', ':BufferLineGoToBuffer 1<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b2', ':BufferLineGoToBuffer 2<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b3', ':BufferLineGoToBuffer 3<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b4', ':BufferLineGoToBuffer 4<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b5', ':BufferLineGoToBuffer 5<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b6', ':BufferLineGoToBuffer 6<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b7', ':BufferLineGoToBuffer 7<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b8', ':BufferLineGoToBuffer 8<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b9', ':BufferLineGoToBuffer 9<CR>', {})
