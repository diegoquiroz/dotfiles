local telescope = require('telescope')

telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix="🔍 "
  },
  extensions = {
    project = {
      base_dirs = {
        {path = '~/Developer/platzi', max_depth = 2},
        {'~/Developer/platzi/Platzi/django'},
      },
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension('project')
--telescope.load_extension('projects')

vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':lua require("telescope.builtin").find_files()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require("telescope.builtin").find_files()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>bb', ':lua require("telescope.builtin").buffers()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', {})
--vim.api.nvim_set_keymap('n', '<Leader>pp', ':Telescope projects<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>pp', ':lua require("telescope").extensions.project.project{display_type = "full"}<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tr', ':lua require("telescope.builtin").resume()<CR>', {})
