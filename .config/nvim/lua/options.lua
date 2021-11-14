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
  require('github-theme').setup({
    theme_style = "dark",
    hide_inactive_statusline = true,
    function_style = "italic",
    dark_sidebar = false
  })

else
  require('github-theme').setup({
    theme_style = "dark",
    -- theme_style = "dark_default",
    hide_inactive_statusline = true,
    function_style = "italic",
    dark_sidebar = false
  })

end

require('lualine').setup {
  options = {
    theme = 'github'
  }
}

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
    'go',
    'yaml',
    'toml'
  },
  highlight = {
    enable = true
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
  },
  autopairs = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }
}


-- Indent Lines
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

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
  filetype_exclude = {"help", "terminal", "fzf", "floaterm", "alpha", "packer", "floatline"},
  buftype_exclude = {"terminal", "nofile"},
 
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

-- vim.g.python3_host_prog = '/usr/local/bin/python3'
-- vim.g.python_host_prog = '/usr/bin/python'


--
-- Markdown Previewer
--
vim.g.mkdp_refresh_slow = 1
