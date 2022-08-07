function! HighlightFullSpace()
  highlight HighlightFullSpace cterm=reverse ctermfg=LightCyan gui=reverse guifg=LightCyan
endfunction

if has('syntax')
  augroup HighlightFullSpace
    autocmd!
    autocmd ColorScheme       * call HighlightFullSpace()
    autocmd VimEnter,WinEnter * match HighlightFullSpace /　/
  augroup END
  call HighlightFullSpace()
endif

" アクティブウィンドウに限りカーソル行(列)を強調する
augroup vimrc_set_cursorline_only_active_window
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" カレントバッファのフルパスをクリップボードにコピー
function! MyCopyCurrentPathToClipboard() abort
  let @* = expand("%:p")
endfunction

" カレントバフッファをVSCodeで開く
function! MyOpenCurrentBufferOnVSCode() abort
  call system("code -r " . expand("%:p"))
endfunction
