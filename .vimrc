""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
let s:dein_dir = '~/.cache/dein'
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/dein/dein.vim
endif

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml('~/.vim/dein.toml')
  call dein#end()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if dein#check_install()
  call dein#install()
endif
""""""""""""""""""""""""""""""

" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', [
      \ 'around',
      \ 'vim-lsp',
      \ 'file'
      \ ])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'Around'},
      \ })

call ddc#custom#patch_global('sourceOptions', {
      \ 'vim-lsp': {
      \   'mark': 'LSP',
      \   'matchers': ['matcher_head'],
      \   'forceCompletionPattern': '\.|:|->|"\w+/*'
      \ },
      \ })

call ddc#custom#patch_global('sourceOptions', {
      \ 'file': {
      \   'mark': 'file',
      \   'isVolatile': v:true,
      \   'forceCompletionPattern': '\S/\S*',
      \ }})

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

" vim の独自拡張機能を使う(viとの互換性をとらない)
set nocompatible
" 文字コードを指定する
set encoding=utf-8
" ファイルエンコードを指定する
set fileencodings=utf-8
" 自動認識させる改行コードを指定する
set fileformats=unix
" 末尾に自動的に改行を加えない
set nofixeol
"フォントの設定
" see font of migu -> http://bamka.info/font-migu
set guifont=Ricty_Diminished_Regular:h14
set guifontwide=Ricty_Diminished_Regular:h14
" \tの見た目の幅を指定する
set tabstop=2
" vimで自動的に設定されるインデントの幅を指定する
set shiftwidth=2
" タブ入力時は空白に展開する 逆はnoexpandtab
set expandtab
" タブを入力して空白スペースにする場合のサイズを指定(noexpandtabの場合は無関係な設定)
set softtabstop=2
" 常にステータスラインを表示する
set laststatus=2
" バックアップをとる
" 逆は [ set nobackup ]
set backup
" バックアップを作るディレクトリを指定する
set backupdir=~/backup
" Undo情報を永続化する
set undofile
" undo用のファイルを作るディレクトリを指定する
set undodir=~/backup
" 検索履歴を50個残す
set history=50
" 検索時に大文字小文字を区別しない
set ignorecase
" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" 検索語にマッチした単語をハイライトする
" 逆は [ set nohlsearch ]
set hlsearch
" /を二回押下でハイライトを解除
nnoremap // :nohlsearch<CR>
" インクリメンタルサーチを使う ( 検索語を入れている途中から随時マッチする文字列の検索を開始)
" 逆は [ set noincsearch ]
set incsearch
" 行番号を表示する
" 逆は [ set nonumber ]
set number
" カーソルが何行目の何列目に置かれているかを表示する 
" 逆は [ set noruler ]
set ruler
" 改行 ( $ ) やタブ ( ^I ) を可視化する
set list
"set listchars=tab:>-,trail:>,eol:$ "改行を表示する場合
set listchars=tab:>-,trail:~
" 括弧入力時に対応する括弧を強調する
set showmatch
" カーソル行の背景色変更
set cursorline
" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
set clipboard=unnamed,autoselect
" menuoneで常に補完ウィンドウを表示、noinsertで勝手に1件目を挿入させない
set completeopt=menuone,noinsert

" matchit関連の設定
" using matchit plugin
packadd! matchit

" grep 系の処理は、自動的にquickfixを開く
autocmd QuickFixCmdPost *grep* cwindow

" VimFileExplore関連の設定
"  " デフォルトでツリーを表示させる
autocmd VimEnter * execute 'VimFilerExplore'
" vimFilerでファイルを開いた場合は、別タブで開くように設定
let g:vimfiler_edit_action = 'tabopen'

" cofee scriptのファイルタイプのマッピング
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

" vim-indent-guidesの設定
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

" 構文ごとに色分け表示する,逆は [ syntax off ]
syntax on
" [ syntax on ] の場合のコメント文の色を変更する
highlight Comment ctermfg=LightCyan

" ウィンドウ幅で行を折り返す, 逆は [ set nowrap ]
set wrap

"カラースキーマを設定
set t_Co=256
let g:purify_bold = 1        " default: 1
let g:purify_italic = 0      " default: 1
let g:purify_underline = 1   " default: 1
let g:purify_undercurl = 1   " default: 1
let g:purify_inverse = 1     " default: 1
colorscheme purify
" highlight Search term=reverse cterm=bold ctermfg=233 ctermbg=208 gui=bold guifg=#000000 guibg=#FD971F

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=LightCyan gui=reverse guifg=LightCyan
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
highlight SpecialKey ctermfg=LightCyan

""""""""""""""""""""""""""
"lightline.vimの設定
let g:lightline = {
  \ 'colorscheme': 'purify',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['fugitive', 'filename'],
  \   ]
  \ },
  \ 'inactive': {
  \   'left': [ ['filename', 'inactive-line'] ]
  \ },
  \ 'component': {
  \   'inactive-line': '##################################################'
  \ },
  \ 'component_function': {
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \ }
\ }

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \ '' != expand('%') ? expand('%') : '[No Name]')
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'read-only ' : ''
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return '[' . fugitive#head() . ']'
    endif
  catch
  endtry
  return ''
endfunction

if has('unix') && !has('gui_running')
  inoremap <silent> <Esc> <Esc>
  inoremap <silent> <C-[> <Esc>
endif


"----------key bind for screen control----------"
nnoremap [screen_control] <Nop>
nmap <Space> [screen_control]

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

"-----------------Unite settings-----------------"
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nmap <Space>r [unite_rails]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"最近使用したバッファ一覧
nnoremap <silent> [unite]bu :<C-u>Unite buffer<CR>
"最近使用したレジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"最近使用したディレクトリ一覧
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
"現在開いているtab一覧
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
"ブックマーク一覧
nnoremap <silent> [unite]bm :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"ヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"Uniterails/controllerを実行
nnoremap <silent> [unite_rails]cont :<C-u>Unite<Space>rails/controller<CR>
"Uniterails/modelを実行
nnoremap <silent> [unite_rails]mo :<C-u>Unite<Space>rails/model<CR>
"Uniterails/mailerを実行
nnoremap <silent> [unite_rails]ma :<C-u>Unite<Space>rails/mailer<CR>
"Uniterails/viewを実行
nnoremap <silent> [unite_rails]v :<C-u>Unite<Space>rails/view<CR>
"Unite rails/jobを実行
nnoremap <silent> [unite_rails]jo :<C-u>Unite<Space>rails/jo<CR>
"Uniterails/javascriptを実行
nnoremap <silent> [unite_rails]js :<C-u>Unite<Space>rails/javascript<CR>
"Uniterails/stylesheetを実行
nnoremap <silent> [unite_rails]css :<C-u>Unite<Space>rails/stylesheet<CR>
"Uniterails/assetを実行
nnoremap <silent> [unite_rails]a :<C-u>Unite<Space>rails/asset<CR>
"Uniterails/specを実行
nnoremap <silent> [unite_rails]s :<C-u>Unite<Space>rails/spec<CR>
"Unite rails/libを実行
nnoremap <silent> [unite_rails]l :<C-u>Unite<Space>rails/lib<CR>
"Unite rails/helperを実行
nnoremap <silent> [unite_rails]h :<C-u>Unite<Space>rails/helper<CR>
"Unite rails/configを実行
nnoremap <silent> [unite_rails]conf :<C-u>Unite<Space>rails/config<CR>
"Unite rails/initializerを実行
nnoremap <silent> [unite_rails]i :<C-u>Unite<Space>rails/initializer<CR>
"Unite rails/dbを実行
nnoremap <silent> [unite_rails]db :<C-u>Unite<Space>rails/db<CR>
"Unite rails/decoratorを実行
nnoremap <silent> [unite_rails]de :<C-u>Unite<Space>rails/decorator<CR>
"Unite rails/decoratorを実行
nnoremap <silent> [unite_rails]de :<C-u>Unite<Space>rails/decorator<CR>
"Unite rails/webpackを実行
nnoremap <silent> [unite_rails]w :<C-u>Unite<Space>rails/webpack<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjj,kkでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> kk <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+lで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>"

" insertモードのカーソル移動をEmacsに似せて上下左右だけ実現
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

" terminal-jobモードからterminal-normalモードの切り替えをマッピング
tnoremap <Esc> <C-\><C-n>

" vim-lsp関連の設定
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
