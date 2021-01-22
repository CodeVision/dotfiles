" FZF

let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g "!.git"'
nnoremap <silent> <C-p>        :<C-u>FzfPreviewFromResourcesRpc directory<CR>

" NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^tags$', '\.git$[[dir]]']

" barbar
let bufferline = {}
let bufferline.icons = 'numbers'

" Magic buffer-picking mode
nnoremap <silent> <Leader>s :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Leader>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Leader>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <Leader>bp :BufferPrevious<CR>
nnoremap <silent>    <Leader>bn :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <Leader>b< :BufferMovePrevious<CR>
nnoremap <silent>    <Leader>b> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    1<Leader>b :BufferGoto 1<CR>
nnoremap <silent>    2<Leader>b :BufferGoto 2<CR>
nnoremap <silent>    3<Leader>b :BufferGoto 3<CR>
nnoremap <silent>    4<Leader>b :BufferGoto 4<CR>
nnoremap <silent>    5<Leader>b :BufferGoto 5<CR>
nnoremap <silent>    6<Leader>b :BufferGoto 6<CR>
nnoremap <silent>    7<Leader>b :BufferGoto 7<CR>
nnoremap <silent>    8<Leader>b :BufferGoto 8<CR>
nnoremap <silent>    9<Leader>b :BufferGoto 9<CR>
