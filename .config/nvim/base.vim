
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"set t_Co=256

syntax on
set encoding=utf-8
set cursorline
set cursorcolumn
set ruler

set fileformat=unix

"" Use tabs
set noexpandtab
set smarttab

"" Use spaces instead of tabs

"" Tab size 1 tab = 4 spaces
set tabstop=4
"set tabstop=2
set shiftwidth=4

set noswapfile

set nowrap!
set autoindent
"set textwidth=80
set formatoptions=cq

"set number
set relativenumber
set mouse=a
set laststatus=2
set clipboard=unnamed

let mapleader=" "
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>bk :bd<CR>


highlight link htmlTag htmlTagName
highlight link htmlEndTag htmlTagName
