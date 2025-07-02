" Open files in vertical horizontal split
nnoremap <silent> [fzf]f :call fzf#run({
\   'left': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

nnoremap <silent> [fzf]m :call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})<CR>

nnoremap <silent> [fzf]<Enter> :Files<CR>

" Select Bufffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> [fzf]t :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
