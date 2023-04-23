if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
else
  source ~/.config/nvim/base.vim
  source ~/.config/nvim/base-maps.vim

lua << EOF

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')


-- Import files
require('options')
--require('ntree')
require('nbufferline')
require('telescope-nvim')
EOF
endif
