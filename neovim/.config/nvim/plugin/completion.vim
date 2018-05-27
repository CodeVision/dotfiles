" General

" LanguageServer(s)
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ }

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 50

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.javascript = ['LanguageClient', 'file']
