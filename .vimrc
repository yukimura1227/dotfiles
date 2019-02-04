""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/dein/dein.vim
endif

" Required:
call dein#begin('~/.vim/dein')

" Let dien manage dien
" Required:
call dein#add('Shougo/dein.vim')

" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
call dein#add('Shougo/neomru.vim')
" Uniteからrailsプロジェクトの移動を簡単にできるようにする
call dein#add('basyura/unite-rails')
" ファイラー
call dein#add('Shougo/vimfiler')
" 自動的に閉じ括弧を挿入してくれるプラグイン
call dein#add('Townk/vim-autoclose')
" grepを可能にするプラグイン
call dein#add('vim-scripts/grep.vim')
" Ruby向けにendを自動挿入してくれるプラグイン
call dein#add('tpope/vim-endwise')
" Gitを便利に使うプラグイン
call dein#add('tpope/vim-fugitive')
" Gitの変更行の視覚化
call dein#add('airblade/vim-gitgutter')
" ステータスラインをいい感じにしてくれるプラグイン
call dein#add('itchyny/lightline.vim')
" coffee scriptをいい感じに編集できるプラグイン"
call dein#add('kchmck/vim-coffee-script')
" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')

" コード補完
call dein#add('Shougo/neocomplete.vim')
" ヤンクのヒストリーを管理できるプラグイン
call dein#add('Shougo/neoyank.vim')
" 文字列を何かでくくったり解除したりするプラグイン
call dein#add('tpope/vim-surround')
" rubocop自動実行プラグイン
call dein#add('scrooloose/syntastic')
" migemo用プラグイン(要 brew install cmigemo)
call dein#add('haya14busa/vim-migemo')
" SQLのfomat用プラグイン
call dein#add('yukimura1227/fmtsql.vim')

" vim上でshellを動かすためのユーティリティ
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/vimshell')

call dein#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if dein#check_install()
  call dein#install()
endif
""""""""""""""""""""""""""""""

" neocompleteの設定
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_enable_camel_case_completion = 0
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" vim の独自拡張機能を使う(viとの互換性をとらない)
set nocompatible
" 文字コードを指定する
set encoding=utf-8
" ファイルエンコードを指定する
set fileencodings=utf-8
" 自動認識させる改行コードを指定する
set fileformats=unix
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
" using matchit plugin
packadd! matchit
" デフォルトでツリーを表示させる
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
" 構文ごとに色分け表示する
" 逆は [ syntax off ]
syntax on
" [ syntax on ] の場合のコメント文の色を変更する
highlight Comment ctermfg=LightCyan
" ウィンドウ幅で行を折り返す
" 逆は [ set nowrap ]
set wrap
"カラースキーマを設定
let g:molokai_original = 1
set t_Co=256
colorscheme molokai
highlight Search term=reverse cterm=bold ctermfg=233 ctermbg=208 gui=bold guifg=#000000 guibg=#FD971F

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
  \ 'colorscheme': 'wombat',
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
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
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
nnoremap <silent> [unite_rails]job :<C-u>Unite<Space>rails/job<CR>
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

" rubocupの自動実行の設定
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop', 'mri']
" let g:syntastic_auto_loc_list = 1

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>"

" insertモードのカーソル移動をEmacsに似せて上下左右だけ実現
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
