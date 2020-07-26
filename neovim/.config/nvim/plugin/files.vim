" FZF

let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g "!.git"'

" xnoremap <Leader>p <Plug>(FzfPreview)

" nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> <C-p>        :<C-u>FzfPreviewFromResources directory<CR>
" nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
" nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
" nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
" nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
" nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
" nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
" nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
" nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
" xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
" nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
" nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
" nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>

nnoremap           <Plug>(FzfPreviewProjectGrep)    :<C-u>FzfPreviewProjectGrep<Space>

nmap <Leader>pgr <Plug>(FzfPreviewProjectGrep)

" NerdTree
nnoremap <Leader>f :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^tags$', '\.git$[[dir]]']
