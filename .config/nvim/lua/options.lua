function os_command(command)
  local handle = io.popen(command)
  local result = handle:read('*a')
  handle.close()
  handle:close()

  if raw then 
    return output
  end

  result = string.gsub(
    string.gsub(
      string.gsub(result, '^%s+', ''),
      '%s+$',
      ''
    ),
    '[\n\r]+',
    ' '
  )
  return result
end


-- Colorsheme and statusline

if (vim.fn['has']('macunix') == 1 and os_command('2>/dev/null defaults read -g AppleInterfaceStyle') == '') then
  require('line')
  require('github-theme').setup({
    themeStyle = 'light',
    hideInactiveStatusline = true,
    functionStyle = "italic",
    darkSidebar = false
  })

else
  require('line')
  require('github-theme').setup({
    themeStyle = 'dark',
    hideInactiveStatusline = true,
    functionStyle = "italic",
    darkSidebar = false
  })

end

-- Auto Pairs
local npairs = require('nvim-autopairs')
npairs.setup({
  check_ts = true
})

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'python',
    'javascript',
    'typescript',
    'html',
    'css',
    'lua',
    'php',
    'rust',
    'go'
  },
  highlight = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
  autopairs = { enable = true }
}


-- Indent Lines
vim.opt.listchars = {
  space = "⋅",
  eol = "↴",
}
require('indent_blankline').setup{
  use_treesitter = true,
  space_char_blankline = " ",
  show_end_of_line = true,

  strict_tabs = true,
  show_current_context = true,
  context_patterns = {
    "class",
    "function",
    "method",
    "^if",
    "while",
    "for",
    "with",
    "func_literal",
    "block",
    "try",
    "except",
    "argument_list",
    "object",
    "dictionary"
  },
  filetype_exclude = {"help", "terminal", "fzf", "floaterm"},
  buftype_exclude = {"terminal"},
 
  --show_trailing_blankline_indent = false,

}



--
-- Sneak, plugin like easy motion
--
vim.api.nvim_set_var('sneak#label', 1)


--[[
Enhanced F and T
--]]
vim.api.nvim_set_keymap("n", ";", "<Plug>(eft-repeat)", {})
vim.api.nvim_set_keymap("x", ";", "<Plug>(eft-repeat)", {})

vim.api.nvim_set_keymap("n", "f", "<Plug>(eft-f)", {})
vim.api.nvim_set_keymap("x", "f", "<Plug>(eft-f)", {})
vim.api.nvim_set_keymap("o", "f", "<Plug>(eft-f)", {})
vim.api.nvim_set_keymap("n", "F", "<Plug>(eft-F)", {})
vim.api.nvim_set_keymap("x", "F", "<Plug>(eft-F)", {})
vim.api.nvim_set_keymap("o", "F", "<Plug>(eft-F)", {})

vim.api.nvim_set_keymap("n", "t", "<Plug>(eft-t)", {})
vim.api.nvim_set_keymap("x", "t", "<Plug>(eft-t)", {})
vim.api.nvim_set_keymap("o", "t", "<Plug>(eft-t)", {})
vim.api.nvim_set_keymap("n", "T", "<Plug>(eft-T)", {})
vim.api.nvim_set_keymap("x", "T", "<Plug>(eft-T)", {})
vim.api.nvim_set_keymap("o", "T", "<Plug>(eft-T)", {})



--[[
IPython plugin
--]]
vim.g.nvim_ipy_perform_mappings = 0
vim.api.nvim_set_keymap('', '<c-s>', '<Plug>(IPy-Run)', {silent = true})
vim.api.nvim_set_keymap('', '<c-d>', '<Plug>(IPy-RunAll)', {silent = true})

--vim.g.python3_host_prog = '/usr/local/anaconda3/bin/python3'
--vim.g.python_host_prog = '~/Developer/venvs/neovim2/bin/python'


--
-- Markdown Previewer
--
vim.g.mkdp_refresh_slow = 1

--
-- Theme configs
--
vim.api.nvim_set_keymap('n', '<Leader>9', [[<Cmd>lua require('material.functions').change_style('lighter')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>0', [[<Cmd>lua require('material.functions').change_style('darker')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>8', [[<Cmd>lua require('material.functions').change_style('deep ocean')<CR>]], { noremap = true, silent = true })

require('todo-comments').setup{}
require('trouble').setup{}
require('colorizer').setup()
require('gitsigns').setup()
