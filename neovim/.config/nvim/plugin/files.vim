" NERDtree
let g:NERDTreeAutoDeleteBuffer=1

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
