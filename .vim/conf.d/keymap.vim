if has('unix') && !has('gui_running')
  inoremap <silent> <Esc> <Esc>
  inoremap <silent> <C-[> <Esc>
endif

" insertモードのカーソル移動をEmacsに似せて上下左右,先頭・末尾だけ実現
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>

" デフォルトのタグジャンプ C-] を、LSPによるジャンプにも対応
nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"

" terminal-jobモードからterminal-normalモードの切り替えをマッピング
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>

nmap copy :call MyCopyCurrentPathToClipboard()<CR>
nmap code :call MyOpenCurrentBufferOnVSCode()<CR>

" KeyMapのグルーピング。競合しないようにここにまとめて宣言
nnoremap [screen_control] <Nop>
nmap <Space> [screen_control]
nnoremap [fzf] <Nop>
nmap <Space>f [fzf]
nnoremap [yazi] <Nop>
nmap <Space>y [yazi]

"---------- 以下は、グルーピングして競合しないようにしているmapping系 ----------"

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

