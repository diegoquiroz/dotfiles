"----------dein Scripts----------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('tweekmonster/startuptime.vim')
  call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
  call dein#add('nvim-treesitter/playground')

  call dein#add('akinsho/nvim-bufferline.lua')
  
  " Improve movements
  " Vertical Movement
  call dein#add('justinmk/vim-sneak')
  " Horizontal movement
  call dein#add('hrsh7th/vim-eft')

  " Colorshemes
  call dein#add('monsonjeremy/onedark.nvim')
  call dein#add('marko-cerovac/material.nvim')
  call dein#add('projekt0n/github-nvim-theme')

  "TODO: define which indent guide plugin to use
  "Indent lines
  call dein#add('lukas-reineke/indent-blankline.nvim')

  "Comment Code
  call dein#add('tpope/vim-commentary')

  " Align columns
  "call dein#add('godlygeek/tabular')

  " Markdown
  "call dein#add('plasticboy/vim-markdown')
  call dein#add('iamcco/markdown-preview.nvim', {
  \ 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
	\ 'build': 'sh -c "cd app && yarn install"' })

  " Side bar
  call dein#add('kyazdani42/nvim-tree.lua')
  
  " Bottom line for Vim
  call dein#add('glepnir/galaxyline.nvim', {'rev': 'main'})

  " Icons for NERDTree and Airline
  call dein#add('kyazdani42/nvim-web-devicons')

  " Fuzzy finder for vim
  call dein#add('nvim-lua/popup.nvim')
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim')

  " Project management
  call dein#add('ahmedkhalf/project.nvim')

  " Git stuff
  call dein#add('lewis6991/gitsigns.nvim')

  " Add tmux navigation shortcuts to vim
  call dein#add('christoomey/vim-tmux-navigator')

  " Language Server Protocol
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/vim-vsnip-integ')

  " Cool error/diagnostics list
  call dein#add('folke/trouble.nvim')

  " Autocomplete plugin
  call dein#add('hrsh7th/nvim-compe')
  call dein#add('folke/todo-comments.nvim')

  " Python
  " Jupyter Notebooks
  "call dein#add('bfredl/nvim-ipy')

  " HTML plugins
  "call dein#add('mattn/emmet-vim')

  " Pair characters plugin
  call dein#add('windwp/nvim-autopairs')
 
  " Color hexcodes
  call dein#add('norcalli/nvim-colorizer.lua')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
"End dein Scripts-------------------------



"-------------------Import files------------------
source ~/.config/nvim/base.vim
"source ~/.config/nvim/gui.vim
lua require('options')
lua require('formatter')
lua require('lsp')
lua require('completion')
lua require('ntree')
lua require('nbufferline')
lua require('project')
lua require('telescope-nvim')
