" Colorsheme
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
	colorscheme onehalfdark
	let g:airline_theme='onehalfdark'
else
	colorscheme onehalflight
	let g:airline_theme='onehalflight'
endif

" Airline
"let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1


" pear-tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" Indent lines (spaces)
"let g:indentLine_color_term = 239
"Indent color (tabs)
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=236

"
" FZF commands
"
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nmap <Leader><Leader> :ProjectFiles<CR>
nmap <Leader>bb :Buffers<CR>

"
" HTML plugins
"

" Emmet
let g:user_emmet_leader_key=','

"
" JavaScript Config plugins
"

" vim-javascript hightlighter
let g:javascript_plugin_jsdoc = 1

" Neomake configs
function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction


if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

let g:neomake_open_list = 2
let b:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint' 
let b:neomake_eslint_exe = b:eslint_exe
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_html_enabled_makers = []

"
"NERDTree configs
"
augroup nerdtree_open
""	autocmd!
"  "	autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"	autocmd VimEnter * NERDTree | wincmd p
	autocmd BufEnter * lcd %:p:h
augroup END
let g:NERDTreeWinSize = 25
"autocmd BufWinEnter * NERDTreeMirror
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

nmap <Leader>op :NERDTreeFind<CR>


" Minimap
"let g:minimap_highlight='Visual'
"let g:python_highlight_all = 1
"let g:minimap_toggle='<leader>tm'

" Deoplete config
"
"call deoplete#custom#option('auto_complete', v:false)
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Deoplete JEDI (python)
"let g:python_host_prog = '/Users/diego/Developer/venvs/neovim2/bin/python'
"let g:python3_host_prog = '/Users/diego/Developer/venvs/neovim/bin/python'
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#sources#jedi#enable_typeinfo=0

" Deoplete C, C++, ObjC
let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo='priority'



" CONFIGS of TERN JS
" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [ 'jsx' ]

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

