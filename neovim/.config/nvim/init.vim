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

" General
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Interface
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'

" Text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

" ------------------------------------------------------------------------------
" Coding
" ------------------------------------------------------------------------------

" General
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'sgur/vim-editorconfig'

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'w0rp/ale'

" Misc Languages
Plug 'hashivim/vim-terraform'

" Markup language
Plug 'gabrielelana/vim-markdown'

" CSS
Plug 'JulesWang/css.vim'
Plug 'ap/vim-css-color'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Ruby
Plug 'vim-ruby/vim-ruby'

" Shell
Plug 'chrisbra/vim-zsh'

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
set autoread                    " automatically read changed files

set sessionoptions-=options

set showmatch                   " show matching brackets
set matchtime=3                 " duration to show matching brackets

set splitbelow                  " new split window goes below
set splitright                  " new split window goes right

set mouse=a

scriptencoding = 'utf-8'

" set characters to show when listing whitespace
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪

set backspace=indent,eol,start

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" ------------------------------------------------------------------------------
" Default indentations / spacings (for unknown files)
" ------------------------------------------------------------------------------
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab

" ------------------------------------------------------------------------------
" Search settings
" ------------------------------------------------------------------------------
set ignorecase                  " ignore case while searching
set smartcase                   " use case sensitivity if implied by capitals
set wrapscan                    " wrap to top when reaching EOF
set incsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" ==============================================================================
" Completions
" ==============================================================================

set wildmenu
set wildmode=full

" ignore files for wildcard expansion and completion
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem,.git,.svn
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*
set wildignore+=*.swp,*~,._*

" lower prio for following file extensions for file name completion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb
set suffixes+=.ind,.idx,.ilg,.inx,.out,.toc

" ------------------------------------------------------------------------------
" Syntax highlighting & Colorschemes
" ------------------------------------------------------------------------------
syntax on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

colorscheme codedark

" ------------------------------------------------------------------------------
" Filetype settings
" ------------------------------------------------------------------------------
filetype plugin indent on

set autoindent

" ==============================================================================
" Mappings
" ==============================================================================
let g:mapleader = ';'
let g:maplocalleader = ','

noremap! jj <Esc>

nnoremap Y y$
nnoremap Q @q

" text editing (S-Enter does not work in the terminal)
nnoremap <S-Enter> O<Esc>
nnoremap <Enter> o<Esc>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)

" movement
noremap k gk
noremap j gj
noremap gj 5j
noremap gk 5k

" buffers
noremap <silent> <leader>l :ls<CR>
noremap <silent> <leader>b <C-^>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

map <leader>r :source $MYVIMRC<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

inoremap <C-U> <C-G>u<C-U>
