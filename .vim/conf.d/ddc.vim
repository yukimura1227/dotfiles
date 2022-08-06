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

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
