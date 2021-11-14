if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
else

  source ~/.config/nvim/base.vim
  source ~/.config/nvim/base-maps.vim

lua << EOF
-- Import files
require('impatient')
--require('plugins')
require('packer_compiled')
require('options')
require('formatter')
require('ntree')
require('nbufferline')
require('telescope-nvim')
EOF
endif
