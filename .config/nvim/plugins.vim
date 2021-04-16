
"
" Floaterm commands
"
"tnoremap <C-n> <C-\><C-n>
"nmap <Leader>ott :FloatermNew --width=0.8 --height=0.8 --name=floaterm<CR>
"nmap <Leader>ot :FloatermToggle floaterm<CR>



" TODO: Rework this in LUA
" Neomake configs
"function! MyOnBattery()
"  if has('macunix')
"    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
"  elseif has('unix')
"    return readfile('/sys/class/power_supply/AC/online') == ['0']
"  endif
"  return 0
"endfunction


"if MyOnBattery()
"  call neomake#configure#automake('w')
"else
"  call neomake#configure#automake('nw', 1000)
"endif


"let g:neomake_python_pylint_maker = {
"  \ 'args': [
"  \ '-d', 'E0401',
"  \ '-f', 'text',
"  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
"  \ '-r', 'n'
"  \ ],
"  \ 'errorformat':
"  \ '%A%f:%l:%c:%t: %m,' .
"  \ '%A%f:%l: %m,' .
"  \ '%A%f:(%l): %m,' .
"  \ '%-Z%p^%.%#,' .
"  \ '%-G%.%#',
"  \ }







"
" COC configuration
" 
let g:coc_global_extensions = ['coc-lua', 'coc-rls', 'coc-tsserver', 'coc-snippets', 'coc-emmet', 'coc-html', 'coc-eslint', 'coc-prettier', 'coc-tailwindcss', 'coc-yaml', 'coc-json']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <Nul> coc#refresh()
inoremap <expr> <c-space> pumvisible() ? "\<C-Y>" : "\<CR>"

inoremap <expr> ,, pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 
" IPY
"
"let g:nvim_ipy_perform_mappings = 0
"map <silent> <c-s> <Plug>(IPy-Run)
"map <silent> <c-d> <Plug>(IPy-RunAll)

"let g:python3_host_prog = '~/Developer/venvs/neovim/bin/python'
"let g:python3_host_prog = '/usr/local/anaconda3/bin/python3'
"let g:python_host_prog = '~/Developer/venvs/neovim2/bin/python'

