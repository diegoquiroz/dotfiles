nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

"nmap <Leader>bk :b#<bar>bd#<CR>
nmap <Leader>bk :bp<bar>bd #<CR>
nmap <Leader>bp :bprev<CR>
nmap <Leader>bn :bnext<CR>
nmap <Leader>wv :vnew<CR>
nmap <Leader>wc :close<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

nmap ]x ctrih/^# %%<CR><CR>
let g:jupytext_fmt = 'py'


" Commands
:command Format :%!jq .
:command Unformat :%!jq -c .
