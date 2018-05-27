" General

" LanguageServer(s)
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ }

autocmd FileType javascript nnoremap <buffer>
      \ <leader>ld :call LanguageClient_textDocument_definition()<CR>
autocmd FileType javascript nnoremap <buffer>
      \ <leader>lh :call LanguageClient_textDocument_hover()<CR>
autocmd FileType javascript nnoremap <buffer>
      \ <leader>lr :call LanguageClient_textDocument_rename()<CR>
autocmd FileType javascript nnoremap <buffer>
      \ <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 50

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.javascript = ['LanguageClient', 'file']
