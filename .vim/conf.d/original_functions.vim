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
