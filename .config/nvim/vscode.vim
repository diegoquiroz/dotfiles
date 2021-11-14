source ~/.config/nvim/base.vim

set nolazyredraw

nmap <Leader>q :quitall<CR>
nmap <Leader>w :w<CR>

nmap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nmap <Leader>wc <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nmap <Leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nmap <Leader>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>


nmap <Leader>wv <Cmd>call VSCodeNotify('workbench.action.splitEditorInGroup')<CR>
nmap <Leader>bp :tabprevious<CR>
nmap <Leader>bn :tabnext<CR>

nmap <Leader>bk <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

nmap <Leader>op <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
xmap <Leader>op <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

" Folding
" nmap <Leader>ff <Cmd>call VSCodeNotify('notebook.fold')<CR>
" nmap <Leader>fu <Cmd>call VSCodeNotify('notebook.unfold')<CR>

imap <tab> <Cmd>call VSCodeNotify('selectNextSuggestion')
imap <s-tab> <Cmd>call VSCodeNotify('selectPrevSuggestion')

" To map moving between windows paste this on keybindings.json
"  {
"      "key": "ctrl+h",
"      "command": "workbench.action.navigateLeft"
"  },
"  {
"      "key": "ctrl+l",
"      "command": "workbench.action.navigateRight"
"  },
