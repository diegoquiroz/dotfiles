"----------dein Scripts----------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundles')
  call dein#begin('$HOME/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('tweekmonster/startuptime.vim')
  call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
  call dein#add('nvim-treesitter/playground')

  " Improve movements
  "call dein#add('takac/vim-hardtime')
  call dein#add('justinmk/vim-sneak')

  " Colorshemes
  call dein#add('dracula/vim', { 'as': 'dracula' })
  call dein#add('sonph/onehalf', {'rtp': 'vim/'})
  "call dein#add('kaicataldo/material.vim', {'rev': 'main'})
  call dein#add('marko-cerovac/material.nvim')

  "Indent lines
  call dein#add('nathanaelkane/vim-indent-guides')

  "Comment Code
  call dein#add('tpope/vim-commentary')

  " Align columns	
  "call dein#add('godlygeek/tabular')

  " Markdown
  "call dein#add('plasticboy/vim-markdown')
  call dein#add('iamcco/markdown-preview.nvim', {
  \ 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
	\ 'build': 'sh -c "cd app && npm install"' })

  " Side bar
  call dein#add('kyazdani42/nvim-tree.lua')
  
  " Bottom line for Vim
  call dein#add('glepnir/galaxyline.nvim', {'rev': 'main'})
  "call dein#add('hoob3rt/lualine.nvim')

  " Icons for NERDTree and Airline
  call dein#add('kyazdani42/nvim-web-devicons')

  " Fuzzy finder for vim
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Add tmux navigation shortcuts to vim
  call dein#add('christoomey/vim-tmux-navigator')

  " Autocomplete plugin
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  " Python
  " Jupyter Notebooks
  call dein#add('bfredl/nvim-ipy')

  " HTML plugins
  "call dein#add('mattn/emmet-vim')

  " Javascript plugins
  "call dein#add('neomake/neomake')
  "call dein#add('pangloss/vim-javascript')

  " Pair characters plugin
  call dein#add('tmsvg/pear-tree')
 
  " Color hexcodes
  call dein#add('gko/vim-coloresque')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
"End dein Scripts-------------------------



"-------------------Import files------------------
source ~/.config/nvim/base.vim
lua require('options')
source ~/.config/nvim/plugins.vim

