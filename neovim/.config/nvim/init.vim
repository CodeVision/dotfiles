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
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle', 'NERDTree'] }

call plug#end()

" ==============================================================================
" Basic settings
" ==============================================================================

set number                      " show line numbers
set showmode                    " show vi mode
set showcmd                     " show commands while typing
set cmdheight=1                 " set number of command lines
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
" Syntax highlighting
" ------------------------------------------------------------------------------
syntax on

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
let g:mapleader=";"

inoremap jj <Esc>

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
