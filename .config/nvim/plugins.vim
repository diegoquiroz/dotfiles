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

"
" COC configuration
" 

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
