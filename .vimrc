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
" Setup Plugin
""""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('${HOME}/.vim/autoload/plug.vim'))
  silent !curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ${MYVIMRC}
  \| endif

call plug#begin()

" Gitの変更行の視覚化
Plug 'airblade/vim-gitgutter'

Plug 'catppuccin/vim'
" rubocopなどを自動実行するためのプラグイン

Plug'dense-analysis/ale'

Plug 'elzr/vim-json'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Gitを便利に使うプラグイン
Plug 'tpope/vim-fugitive'

" 文字列を何かでくくったり解除したりするプラグイン
Plug 'tpope/vim-surround'

Plug 'mattn/vim-maketable'

Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/vim-lsp'

Plug 'prabirshrestha/asyncomplete.vim'

Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Ruby向けにendを自動挿入してくれるプラグイン
Plug 'tpope/vim-endwise'

" ステータスラインをいい感じにする
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" インデントに色を付けて見やすくする
Plug 'Yggdroot/indentLine'

Plug 'yukimura1227/vim-yazi'

call plug#end()

" Required:
filetype plugin indent on

call map(sort(split(globpath(&runtimepath, 'conf.d/*.vim'))), {->[execute('exec "so" v:val')]})
