" ##############################################################################
"
" main neovim configuration file
"
" ##############################################################################
let s:config_dir = split(&runtimepath, ',')[0]
if !filereadable(s:config_dir . '/autoload/plug.vim')
    execute '!curl -fLo ' . s:config_dir . '/autoload/plug.vim --create-dirs '
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    augroup plug
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif

call plug#begin('~/.local/share/nvim/plugins')

" ==============================================================================
"  Plugins
" ==============================================================================

" Interface
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Utility
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'benekastah/neomake', { 'on': ['Neomake'] }

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'

" Colorschemes
Plug 'twerth/ir_black'
Plug 'johnantoni/grb256'

" ------------------------------------------------------------------------------
" Languages
" ------------------------------------------------------------------------------

" HTML / CSS
Plug 'othree/html5.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'


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

scriptencoding = 'utf-8'

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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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
" Completions
" ==============================================================================

set wildmode=full

" ignore files for wildcard expansion and completion
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem,.git,.svn
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*
set wildignore+=*.swp,*~,._*

" lower prio for following file extensions for file name completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb
set suffixes+=.ind,.idx,.ilg,.inx,.out,.toc


" ==============================================================================
" Mappings
" ==============================================================================
let g:mapleader=';'

noremap! jj <Esc>

nnoremap Y y$

nnoremap Q @q

" text editing (S-Enter doesn't work in terminal)
nnoremap <S-Enter> O<Esc>
nnoremap <Enter> o<Esc>

" movement
noremap k gk
noremap j gj
noremap gj 5j
noremap gk 5k

" buffers
map <silent> <Leader>l :ls<CR>
map <silent> <Leader>b <C-^>

map <silent> + :bn<CR>
map <silent> - :bp<CR>

map <C-n> <Down>
map <C-p> <Up>

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
