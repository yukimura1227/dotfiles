if has('unix') && !has('gui_running')
  inoremap <silent> <Esc> <Esc>
  inoremap <silent> <C-[> <Esc>
endif

" KeyMapのグルーピング。競合しないようにここにまとめて宣言
nnoremap [screen_control] <Nop>
nmap <Space> [screen_control]


"----------key bind for screen control----------"
nnoremap <silent> [screen_control]s :<C-u>split<CR>
nnoremap <silent> [screen_control]v :<C-u>vsplit<CR>
nnoremap <silent> [screen_control]j <C-w>j
nnoremap <silent> [screen_control]k <C-w>k
nnoremap <silent> [screen_control]l <C-w>l
nnoremap <silent> [screen_control]h <C-w>h
nnoremap <silent> [screen_control]w <C-w>w
nnoremap <silent> [screen_control]J <C-w>J
nnoremap <silent> [screen_control]K <C-w>K
nnoremap <silent> [screen_control]L <C-w>L
nnoremap <silent> [screen_control]H <C-w>H
nnoremap <silent> [screen_control]r <C-w>r
nnoremap <silent> [screen_control]= <C-w>=
nnoremap <silent> [screen_control]> <C-w>>
nnoremap <silent> [screen_control]< <C-w><
nnoremap <silent> [screen_control]+ <C-w>+
nnoremap <silent> [screen_control]- <C-w>-
nnoremap <silent> [screen_control]t :<C-u>tabnew<CR>
nnoremap <silent> [screen_control]n gt
nnoremap <silent> [screen_control]p gT
nnoremap <silent> [screen_control]o :<C-u>tabo<CR>

