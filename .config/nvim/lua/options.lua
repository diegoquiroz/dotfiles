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
if (vim.fn['has']('macunix') == '1' and os_command('2>/dev/null defaults read -g AppleInterfaceStyle') == '') then
  --vim.cmd('colorscheme onehalflight')
  --require('lualine-light')
else
  --require('lualine-dark')
  vim.cmd('colorscheme dracula')
  require('galaxyline_dark')
  --require('lualine-dark')
  vim.api.nvim_set_var('indent_guides_start_level', 2)
  vim.api.nvim_set_var('indent_guides_guide_size', 1)
end

-- require('galaxyline_dark')

require('nvim-treesitter.configs').setup {
  ensure_installed = {'python', 'javascript', 'html', 'css'},
  highlight = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
}

-- pear-tree
vim.g.pear_tree_smart_openers = 1
vim.g.pear_tree_smart_closers = 1
vim.g.pear_tree_smart_backspace = 1

-- Indent color (tabs)
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_exclude_filetypes = {'help', 'nerdtree', 'fzf', 'floaterm'}

-- Sneak, plugin like easy motion
vim.api.nvim_set_var('sneak#label', 1)

--[[
FZF commands
--]]

function find_git_root()
    return os_command('git rev-parse --show-toplevel 2> /dev/null')
end

vim.cmd("command! ProjectFiles execute 'Files' luaeval('find_git_root()')")
vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':ProjectFiles<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>bb', ':Buffers', {})

--
-- JavaScript Config plugins
--

-- vim-javascript hightlighter
vim.g.javascript_plugin_jsdoc = 1


--
-- nvim-tree.lua
--
vim.g.nvim_tree_width = 25
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_keymap('n', '<Leader>op', ':NvimTreeToggle<CR>', {})

vim.g.nvim_ipy_perform_mappings = 0
vim.api.nvim_set_keymap('', '<c-s>', '<Plug>(IPy-Run)', {silent = true})
vim.api.nvim_set_keymap('', '<c-d>', '<Plug>(IPy-RunAll)', {silent = true})

vim.g.python3_host_prog = '/usr/local/anaconda3/bin/python3'
vim.g.python_host_prog = '~/Developer/venvs/neovim2/bin/python'

--
-- Neomake cofigs
--
--vim.fn['neomake#configure#automake']('rw')
