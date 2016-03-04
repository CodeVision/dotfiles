" General
set completeopt-=preview

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1

let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#max_list = 10

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = '[^. \t0-9]\.([a-zA-Z_]\w*)?'

" Ultisnips
let g:UltiSnipsUsePythonVersion = 3

let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" tern
let g:tern_show_signature_in_pum = 1
