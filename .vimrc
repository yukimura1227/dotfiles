" vim の独自拡張機能を使う(viとの互換性をとらない)
set nocompatible
syntax on

set encoding=utf-8
set fileencodings=utf-8
" unix = LF
set fileformats=unix
" 末尾に自動的に改行を加えない
set nofixeol
set number
" display position of cursor
set ruler
" 2 = always display status line
set laststatus=2

set guifont=UDEV\ Gothic\ NF:h14
set guifontwide=UDEV\ Gothic\ NF:h14

" auto indent width
set shiftwidth=2
" cast tab to space
set expandtab
" tabstop = tab width
set tabstop=2
" auto expand tab -> spaces
set softtabstop=2

" ウィンドウ幅で行を折り返す, 逆は [ set nowrap ]
set wrap

" auto backup
set backup
set backupdir=~/backup
" persist Undo history
set undofile
set undodir=~/backup

" 検索履歴をN個残す
set history=100
" ignore UPPER or lower on search
set ignorecase
" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" 検索語にマッチした単語をハイライトする
set hlsearch

" Space Spaceで、カーソル位置の単語をハイライト *だと、次の単語に飛んでしまうので別で割り当て
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
" //で、ハイライトを解除
nnoremap // :nohlsearch<CR>
" use incremental search
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
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" insertモードとそれ以外でCursorを切り替え
" [0 or 1: Blinking block. [2: steady block. [3: blinking underline
" [4: steady underline [5: blinking bar [6: steady bar
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

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
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
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
