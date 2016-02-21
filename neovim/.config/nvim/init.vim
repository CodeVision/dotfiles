" ##############################################################################
"
" main neovim configuration file
"
" ##############################################################################

let config_dir = split(&rtp, ',')[0]
if !filereadable(config_dir . '/autoload/plug.vim')
    execute '!curl -fLo ' . config_dir . '/autoload/plug.vim --create-dirs '
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

call plug#begin()

" ------------------------------------------------------------------------------
"  Plugins
" ------------------------------------------------------------------------------

" Interface
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Utility
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'twerth/ir_black'
Plug 'johnantoni/grb256'

call plug#end()

" ==============================================================================
" Basic settings
" ==============================================================================

set number                      " show line numbers
set showmode                    " show vi mode
set showcmd                     " show commands while typing
set cmdheight=1                 " set number of command lines
set laststatus=2
set pumheight=8                 " maximum number of completion options
set noswapfile                  " don't use swap files
set scrolloff=5                 " start scrolling when coming near edge

set hidden                      " allow swapping between unsaved buffers

set showmatch                   " show matching brackets
set matchtime=3                 " duration to show matching brackets

set splitbelow                  " new split window goes below
set splitright                  " new split window goes right

" set characters to show when listing whitespace
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪

" ------------------------------------------------------------------------------
" Search settings
" ------------------------------------------------------------------------------
set ignorecase                  " ignore case while searching
set smartcase                   " use case sensitivity if implied by capitals
set wrapscan                    " wrap to top when reaching EOF
set nohlsearch                  " don't highlight searches


" ------------------------------------------------------------------------------
" Syntax highlighting & Colorschemes
" ------------------------------------------------------------------------------
syntax on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme grb256

" ------------------------------------------------------------------------------
" Filetype settings
" ------------------------------------------------------------------------------
filetype plugin indent on

" ------------------------------------------------------------------------------
" temporary
" ------------------------------------------------------------------------------
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" ==============================================================================
" Mappings
" ==============================================================================
let mapleader=";"

inoremap jj <Esc>

" ==============================================================================
" Colors & Theming
" ==============================================================================
let g:terminal_color_0 = '#302020'
let g:terminal_color_1 = '#ffa6af'
let g:terminal_color_2 = '#a5edaa'
let g:terminal_color_3 = '#b58858'
let g:terminal_color_4 = '#6095c5'
let g:terminal_color_5 = '#ac7bde'
let g:terminal_color_6 = '#b4d6d9'
let g:terminal_color_7 = '#cfcfcf'
let g:terminal_color_8 = '#686868'
let g:terminal_color_9 = '#d16d79'
let g:terminal_color_10 = '#59ba55'
let g:terminal_color_11 = '#efbd8b'
let g:terminal_color_12 = '#98cbfe'
let g:terminal_color_13 = '#e5b0ff'
let g:terminal_color_14 = '#63aab0'
let g:terminal_color_15 = '#ffffff'

" ==============================================================================
" Plugin settings
" ==============================================================================

" NERDtree
let g:NERDTreeAutoDeleteBuffer=1

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

" ==============================================================================
" TODO:
" ==============================================================================
" - completions
" - search
" - indentation
" - mappings
"   - buffers
" - folding
" - spelling
