
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

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  
  " Colorshemes
  call dein#add('dracula/vim', { 'as': 'dracula' })
  call dein#add('sonph/onehalf', {'rtp': 'vim/'})
  call dein#add('gosukiwi/vim-atom-dark')

  "Indent lines
  "call dein#add('Yggdroot/indentLine')
  call dein#add('nathanaelkane/vim-indent-guides')

  " Align columns	
  call dein#add('godlygeek/tabular')

  " Markdown
  "call dein#add('plasticboy/vim-markdown')

  " Side bar
  call dein#add('scrooloose/nerdtree')
  " Bottom line for Vim
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " Icons for NERDTree and Airline
  call dein#add('ryanoasis/vim-devicons')
  " Fuzzy finder for vim
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " Add tmux navigation shortcuts to vim
  call dein#add('christoomey/vim-tmux-navigator')
  " Minimap for vim
  "call dein#add('severin-lemaignan/vim-minimap')

  " Autocomplete plugin
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('ervandew/supertab')

  " C, C++, Obj madness
  call dein#add('deoplete-plugins/deoplete-clang')
  call dein#add('Shougo/neoinclude.vim')


  " Python autocomplete
  call dein#add('deoplete-plugins/deoplete-jedi')

  " HTML plugins
  call dein#add('mattn/emmet-vim')

  " Javascript plugins
  call dein#add('neomake/neomake')
  call dein#add('ternjs/tern_for_vim', { 'do': 'npm install' })
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('pangloss/vim-javascript')

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

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------



"-------------------Import files------------------
source ~/.config/nvim/base.vim
source ~/.config/nvim/plugins.vim

