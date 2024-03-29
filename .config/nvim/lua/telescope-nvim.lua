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
      '--no-ignore',
      '--hidden',
      '--ignore-file',
      '.gitignore'
    },
    prompt_prefix="🔍 "
  },
  extensions = {
    project = {
      base_dirs = {
      },
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension('project')
--telescope.load_extension('projects')

vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':lua require("telescope.builtin").find_files({hidden = true})<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require("telescope.builtin").find_files()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>bb', ':lua require("telescope.builtin").buffers()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', {})
--vim.api.nvim_set_keymap('n', '<Leader>pp', ':Telescope projects<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>pp', ':lua require("telescope").extensions.project.project{display_type = "full"}<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tr', ':lua require("telescope.builtin").resume()<CR>', {})
