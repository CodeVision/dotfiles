" Neomake
scriptencoding 'utf-8'
let g:neomake_verbose = 1
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_airline = 1

let g:neomake_error_sign = {
    \ 'text': '✖',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ 'texthl': 'WarningMsg',
    \ }

nnoremap <Leader>e :ll<CR>
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

augroup Neomake
    au!
    autocmd BufEnter,BufWritePost * silent! Neomake
    autocmd BufEnter * call s:CloseLastWindow()
augroup END

" auto close quickfix / location list if it's the last buffer in window
function s:CloseLastWindow()
    if &buftype ==# 'quickfix'
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction
