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
  -- gruvbox
  require('gruvbox').setup({
    contrast = 'soft'
  })
  vim.o.background = "light"
  vim.cmd([[colorscheme gruvbox]])
  
else
  -- gruvbox
  vim.o.background = "dark"
  vim.cmd([[colorscheme gruvbox]])

end

require('lualine').setup {
  options = {
    -- theme = 'dracula-nvim'
    theme = 'gruvbox'
  }
}

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
