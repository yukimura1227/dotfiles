" dduの設定
" uiで、どのUIを使うか指定。 ffならddu-ui-ff
" filerならddu-ui-filer
call ddu#custom#patch_global({
  \  'ui': 'filer',
  \  'uiParams': {
  \    'filer': {
  \      'split': 'horizontal',
  \    }
  \  },
\ })

" sourcesで、ファイルを収集するcollectorを指定。file_recなら、ddu-sorce-file_rec
" fileなら、ddu-source-fileといった具合
call ddu#custom#patch_global({
  \  'sources': [{
  \    'name': 'file',
  \    'params': {}
  \  }],
\ })

" sourceOptionsで、sourceの詳細設定、_でデフォルトの設定を上書きし、matchersに、matcher_substringを設定することで、ddu-filter-matcher_substringを使うようにしている
call ddu#custom#patch_global({
  \  'sourceOptions': {
  \    '_': {
  \      'matchers': ['matcher_substring'],
  \      'columns': ['filename'],
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

call ddu#custom#patch_global({
  \  'uiParams': {
  \    'ff': {
  \      'startFilter': v:true,
  \    },
  \  },
\ })

autocmd FileType ddu-ff call s:my_ddu_ff_settings()
function! s:my_ddu_ff_settings() abort
  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
    \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:my_ddu_ff_filter_settings()
function! s:my_ddu_ff_filter_settings() abort
  inoremap <buffer><silent> <CR>
    \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
    \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
    \ <Cmd>close<CR>
endfunction

autocmd FileType ddu-filer call s:my_ddu_filer_settings()
function! s:my_ddu_filer_settings() abort
  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#filer#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#filer#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> o
    \ <Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>
  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
endfunction
