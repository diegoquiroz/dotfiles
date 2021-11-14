""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 256bit color
""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""
" General stuff
""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax off
set encoding=utf-8
set cursorline
"set colorcolumn=80
set number
set relativenumber
set signcolumn=yes
"set autochdir

" Use LF line endings
set fileformat=unix

set noemoji

" Allow change buffer without saving it
set hidden

" No HIGHLIGHT text when searching
set nohlsearch

" I don't like swap files, sorry vim
set noswapfile

" Scroll within 8 lines
set scrolloff=8

""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs vs spaces
""""""""""""""""""""""""""""""""""""""""""""""""""

"" Use tabs
"set noexpandtab
"set smarttab

"" Use spaces instead of tabs
set expandtab

"" Tab size
" 1 tab = 4 spaces
"set tabstop=4
"set shiftwidth=4

" 1 tab = 2 spaces
set tabstop=2
set shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow 
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: order this stuff
""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menu,menuone,noselect

set nowrap
set autoindent
"set textwidth=80
set formatoptions=cq

set mouse=a
set laststatus=2
set clipboard=unnamed

let mapleader=" "


highlight link htmlTag htmlTagName
highlight link htmlEndTag htmlTagName

