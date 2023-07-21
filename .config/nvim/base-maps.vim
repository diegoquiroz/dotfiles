nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

"nmap <Leader>bk :b#<bar>bd#<CR>
nmap <Leader>bk :bp<bar>bd #<CR>
nmap <Leader>bp :bprev<CR>
nmap <Leader>bn :bnext<CR>
" nmap <Leader>wv :vnew<CR>
nmap <Leader>wv :vsp<CR>
nmap <Leader>wc :close<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


nmap ]x ctrih/^# %%<CR><CR>
let g:jupytext_fmt = 'py'


" Commands
:command Format :%!jq .
:command Unformat :%!jq -c .
