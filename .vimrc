""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ...省略

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

" vim の独自拡張機能を使う(viとの互換性をとらない)
set nocompatible
" 文字コードを指定する
set encoding=utf-8
" ファイルエンコードを指定する
set fileencodings=utf-8
" 自動認識させる改行コードを指定する
set fileformats=unix
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

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=6 gui=reverse guifg=6
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
highlight SpecialKey ctermfg=6
