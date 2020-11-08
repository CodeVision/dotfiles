let g:editorconfig_blacklist = {
  \ 'filetype': ['git.*', 'fugitive'],
  \ }

noremap <silent> <leader>t :IndentBlanklineToggleAll<CR>

let g:indentLine_char = '|'
let g:indentLine_enabled = v:false
let g:indent_blankline_enabled = v:false
