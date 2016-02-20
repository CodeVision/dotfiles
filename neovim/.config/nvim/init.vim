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
"  Interface plugins
" ------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

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
" Plugin settings
" ==============================================================================

" NERDtree
let g:NERDTreeAutoDeleteBuffer=1

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline_powerline_fonts=1


" ==============================================================================
" TODO:
" ==============================================================================
" - completions
" - theme
" - search
" - indentation
" - mappings
"   - buffers
" - folding
" - spelling
