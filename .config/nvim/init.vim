
"----------dein Scripts----------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/diego/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/diego/.vim/bundles')
  call dein#begin('/Users/diego/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/diego/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Colorshemes
  call dein#add('dracula/vim', { 'as': 'dracula' })
  call dein#add('sonph/onehalf', {'rtp': 'vim/'})

  "Indent lines
  call dein#add('nathanaelkane/vim-indent-guides')

  "Comment Code
  call dein#add('tpope/vim-commentary')

  " Align columns	
  call dein#add('godlygeek/tabular')

  " Markdown
  "call dein#add('plasticboy/vim-markdown')

  " Side bar
  call dein#add('scrooloose/nerdtree')
  "
  " Bottom line for Vim
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Icons for NERDTree and Airline
  call dein#add('ryanoasis/vim-devicons')

  " Fuzzy finder for vim
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Terminal in popup window
  call dein#add('voldikss/vim-floaterm')

  " Add tmux navigation shortcuts to vim
  call dein#add('christoomey/vim-tmux-navigator')
  "
  " Minimap for vim
  "call dein#add('severin-lemaignan/vim-minimap')

  " Autocomplete plugin
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  "call dein#add('antoinemadec/coc-fzf')

  " C, C++ and Obj madness

  " Java

  " Python
  " Jupyter Notebooks
  call dein#add('bfredl/nvim-ipy')

  " HTML plugins
  call dein#add('mattn/emmet-vim')

  " Javascript plugins
  call dein#add('neomake/neomake')
  call dein#add('pangloss/vim-javascript')

  " R plugins
  call dein#add('jalvesaq/Nvim-R')

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
source ~/.config/nvim/plugins.vim

