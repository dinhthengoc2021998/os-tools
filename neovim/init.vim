""""""""""""""""""""
" Plugin Manager
""""""""""""""""""""
call plug#begin('$HOME/.config/nvim/plugged')

" /// Color Theme ///
Plug 'morhetz/gruvbox'

"/// File Browser ///
Plug 'preservim/nerdtree'

" /// List your plugins here ///
Plug 'tpope/vim-sensible'          " A sensible set of defaults
Plug 'preservim/nerdtree'          " File explorer
Plug 'junegunn/fzf', {'do': './install --all'} " Fuzzy finder
Plug 'itchyny/lightline.vim'       " Lightweight status line

call plug#end()

"""""""""""""""""""
" General settings
"""""""""""""""""""
" Use Color Theme
set background=dark  " Use dark mode (or light for a lighter background)
colorscheme gruvbox

" Set encoding and file settings
set encoding=utf-8
set fileencoding=utf-8

" Line numbers and relative numbers
set number
set relativenumber

" Enable syntax highlighting and file type detection
syntax on
filetype plugin indent on

" Enable mouse support
set mouse=a

" Use system clipboard
set clipboard=unnamedplus

" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Interface improvements
set showcmd          " Show incomplete commands
set showmode         " Show current mode
set cursorline       " Highlight the current line
set scrolloff=8      " Keep 8 lines visible above and below cursor
set sidescrolloff=8
set signcolumn=yes   " Always show the sign column

" Splits behavior
set splitright       " Open vertical splits to the right
set splitbelow       " Open horizontal splits below

" Faster updates and better performance
set updatetime=300   " Reduce delay for CursorHold event
set timeoutlen=500   " Reduce timeout for mapped sequences

" Wildmenu for command-line completion
set wildmenu
set wildmode=longest:full,full

" Terminal with Tmux
set termguicolors

