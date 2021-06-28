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
vim.g.material_italic_keywords = true

if (vim.fn['has']('macunix') == 1 and os_command('2>/dev/null defaults read -g AppleInterfaceStyle') == '') then
  --require('galaxyline_light-material')
  require('line')
  vim.g.material_style = 'lighter'
else
  --require('galaxyline_dark-material')
  require('line')

  --vim.g.ayucolor = 'mirage'
  --vim.g.tokyonight_style = "night"
  vim.g.material_style = 'deep ocean'
  --vim.api.nvim_set_var('indent_guides_start_level', 2)
  --vim.api.nvim_set_var('indent_guides_guide_size', 1)
end
--vim.cmd[[colorscheme ayu]]
--vim.g.tokyonight_dark_sidebar = false
--vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
--vim.cmd[[colorscheme tokyonight]]
require('material').set()

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
--[[
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_exclude_filetypes = {'help', 'nerdtree', 'fzf', 'floaterm'}
--]]
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_strict_tabs = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
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
                }
--vim.g.indent_blankline_char_highlight_list = {'Error', 'Function'}

--vim.cmd("hi IndentBlanklineChar guifg=#2a2e36")

vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "fzf", "floaterm"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}

vim.g.indent_blankline_show_trailing_blankline_indent = false


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
FZF commands
--]]

function find_git_root()
    return os_command('git rev-parse --show-toplevel 2> /dev/null')
end

vim.cmd("command! ProjectFiles execute 'Files' luaeval('find_git_root()')")
vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':ProjectFiles<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>bb', ':Buffers<CR>', {})

--
-- JavaScript Config plugins
--

-- vim-javascript hightlighter
--vim.g.javascript_plugin_jsdoc = 1



--[[
IPython plugin
--]]
vim.g.nvim_ipy_perform_mappings = 0
vim.api.nvim_set_keymap('', '<c-s>', '<Plug>(IPy-Run)', {silent = true})
vim.api.nvim_set_keymap('', '<c-d>', '<Plug>(IPy-RunAll)', {silent = true})

vim.g.python3_host_prog = '/usr/local/anaconda3/bin/python3'
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

require("todo-comments").setup{}
require("trouble").setup{}
require("colorizer").setup()
