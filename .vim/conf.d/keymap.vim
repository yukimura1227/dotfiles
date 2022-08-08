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

" terminal-jobモードからterminal-normalモードの切り替えをマッピング
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>

nmap copy :call MyCopyCurrentPathToClipboard()<CR>
nmap code :call MyOpenCurrentBufferOnVSCode()<CR>

" KeyMapのグルーピング。競合しないようにここにまとめて宣言
nnoremap [screen_control] <Nop>
nmap <Space> [screen_control]
nnoremap [ddu] <Nop>
nmap <Space>u [ddu]
nnoremap [g:ddu_for_rails] <Nop>
nmap <Space>r [ddu_for_rails]

"---------- 以下は、グルーピングして競合しないようにしているmapping系 ----------"

"----------key bind for ddu---------"
nmap <silent> [ddu]f :<C-u>Ddu file<CR>

"----------key bind for ddu for rails---------"
nnoremap <silent> [ddu_for_rails]ai   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/assets/images")<CR>
nnoremap <silent> [ddu_for_rails]aj   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/assets/javascripts")<CR>
nnoremap <silent> [ddu_for_rails]as   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/assets/stylesheets")<CR>
nnoremap <silent> [ddu_for_rails]cont :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/controllers")<CR>
nnoremap <silent> [ddu_for_rails]de   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/decorators")<CR>
nnoremap <silent> [ddu_for_rails]h    :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/helpers")<CR>
nnoremap <silent> [ddu_for_rails]w    :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/javascript")<CR>
nnoremap <silent> [ddu_for_rails]jo   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/jobs")<CR>
nnoremap <silent> [ddu_for_rails]ma   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/mailers")<CR>
nnoremap <silent> [ddu_for_rails]mo   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/models")<CR>
nnoremap <silent> [ddu_for_rails]v    :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "app/views")<CR>
nnoremap <silent> [ddu_for_rails]conf :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "config")<CR>
nnoremap <silent> [ddu_for_rails]db   :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "db")<CR>
nnoremap <silent> [ddu_for_rails]l    :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "lib")<CR>
nnoremap <silent> [ddu_for_rails]s    :call execute("Ddu file_rec -source-option-path=" . getcwd() . '/' . "spec")<CR>

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

