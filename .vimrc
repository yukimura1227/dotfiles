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
set guifont=HackGenNerd:h14
set guifontwide=HackGenNerd:h14
" \tの見た目の幅を指定する
set tabstop=2
" vimで自動的に設定されるインデントの幅を指定する
set shiftwidth=2
" タブ入力時は空白に展開する 逆はnoexpandtab
set expandtab
" タブを入力して空白スペースにする場合のサイズを指定(noexpandtabの場合は無関係な設定)
set softtabstop=2
" 行番号を表示する
set number
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" ウィンドウ幅で行を折り返す, 逆は [ set nowrap ]
set wrap
" 構文ごとに色分け表示する,逆は [ syntax off ]
syntax on
" 常にステータスラインを表示する
set laststatus=2
" バックアップをとる
set backup
" バックアップを作るディレクトリを指定する
set backupdir=~/backup
" Undo情報を永続化する
set undofile
" undo用のファイルを作るディレクトリを指定する
set undodir=~/backup
" 検索履歴をN個残す
set history=50
" 検索時に大文字小文字を区別しない
set ignorecase
" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" 検索語にマッチした単語をハイライトする
set hlsearch
" Space Spaceで、カーソル位置の単語をハイライト
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
" / /で、ハイライトを解除
nnoremap // :nohlsearch<CR>
" インクリメンタルサーチを使う ( 検索語を入れている途中から随時マッチする文字列の検索を開始)
set incsearch
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

" insertモードとそれ以外でCursorを切り替え
" [0 or 1: Blinking block. [2: steady block. [3: blinking underline
" [4: steady underline [5: blinking bar [6: steady bar
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" """"""""""""""""""""""""""""""
" " プラグインのセットアップ
" """"""""""""""""""""""""""""""
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
" """"""""""""""""""""""""""""""

call map(sort(split(globpath(&runtimepath, 'conf.d/*.vim'))), {->[execute('exec "so" v:val')]})
