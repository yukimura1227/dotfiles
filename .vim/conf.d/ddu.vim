" dduの設定
" uiで、どのUIを使うか指定。 ffならddu-ui-ff
call ddu#custom#patch_global({
  \  'ui': 'ff',
  \  'uiParams': {
  \    'ff': {
  \      'startFilter': v:true,
  \    },
  \   }
\ })

" sourcesで、ファイルを収集するcollectorを指定。file_recなら、ddu-sorce-file_rec
" fileなら、ddu-source-fileといった具合
call ddu#custom#patch_global({
  \  'sources': [
  \    {'name': 'file'},
  \    {'name': 'file_rec'},
  \  ],
\ })

" sourceOptionsで、sourceの詳細設定、_でデフォルトの設定を上書きし、matchersに、matcher_substringを設定することで、ddu-filter-matcher_substringを使うようにしている
call ddu#custom#patch_global({
  \  'sourceOptions': {
  \    '_': {
  \      'matchers': ['matcher_substring'],
  \    },
  \  },
  \  'filterParams': {
  \    'matcher_substring': {
  \       'highlightMatched': 'Search',
  \    },
  \  },
\ })

" kindOptionsで、何をさせるか指定する。
call ddu#custom#patch_global({
  \  'kindOptions': {
  \    'file': {
  \      'defaultAction': 'open',
  \    },
  \  }
\ })

autocmd FileType ddu-ff call s:my_ddu_ff_settings()
function! s:my_ddu_ff_settings() abort
  inoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
    \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer><silent> <C-[>
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

" ファジーファインダーのフィルター入力領域の設定。insertモードでしか利用せず、normalモードに切り替え時は、
" フィルター入力UIは閉じて、ファイル選択などのUI部分に戻るようなコンセプトでキーマップを設定
autocmd FileType ddu-ff-filter call s:my_ddu_ff_filter_settings()
function! s:my_ddu_ff_filter_settings() abort
  inoremap <buffer><silent> <Esc>
    \ <Esc><Cmd>call ddu#ui#ff#close()<CR>
  inoremap <buffer><silent> <C-[>
    \ <Esc><Cmd>call ddu#ui#ff#close()<CR>
  inoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  inoremap <buffer> <C-n>
    \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')+1,0)")<CR>
  inoremap <buffer> <C-p>
    \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')-1,0)")<CR>
endfunction

" ddu-filerの設定
autocmd TabEnter,CursorHold,FocusGained <buffer>
  \ call ddu#ui#filer#do_action('checkItems')
call ddu#custom#patch_local('filer', {
\   'ui': 'filer',
\   'sources': [
\     {
\       'name': 'file',
\       'params': {},
\     },
\   ],
\   'sourceOptions': {
\     '_': {
\       'columns': ['filename'],
\     },
\   },
\   'kindOptions': {
\     'file': {
\       'defaultAction': 'open',
\     },
\   },
\   'uiParams': {
\     'filer': {
\       'winWidth': 40,
\       'split': 'vertical',
\       'splitDirection': 'topleft',
\     }
\   },
\ })
autocmd FileType ddu-filer call s:my_ddu_filer_settings()
function! s:my_ddu_filer_settings() abort
  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
  nnoremap <buffer><silent> <C-[>
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
  nnoremap <buffer> o
    \ <Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>
  nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>"

  nnoremap <buffer><silent><expr> <Space>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>"
  nnoremap <buffer><silent> ..
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>
endfunction
