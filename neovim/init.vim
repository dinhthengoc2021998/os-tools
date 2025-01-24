""""""""""""""""""""
" Plugin Manager
""""""""""""""""""""
call plug#begin('$HOME/.config/nvim/plugged')

" /// Color Theme ///
Plug 'morhetz/gruvbox'

" /// File Browser ///
Plug 'preservim/nerdtree'                      " File browser default
Plug 'xuyuanp/nerdtree-git-plugin'             " Git Status
Plug 'ryanoasis/vim-devicons'                  " Icon
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 

" /// File Search ///
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" /// Status Bar ///
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" /// Terminal Float ///
Plug 'voldikss/vim-floaterm'

" /// Code Intelligence ///
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

" /// Code Syntax Highlight ///
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" /// Debugging ///
Plug 'puremourning/vimspector'

" /// Source Git Version Control ///
Plug 'tpope/vim-fugitive'

" /// Default ///
Plug 'tpope/vim-sensible'          " A sensible set of defaults
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
set clipboard+=unnamedplus "Should export DISPLAY=0 in file ~/.bashrc to load `xsel` clipboard tool"

" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
"set autoindent
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

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

" Disable backup
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""
" Key Bindings Default
"""""""""""""""""""""""
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

xnoremap <leader>( c(<C-r>")<Esc>
xnoremap <leader>{ c{<C-r>"}<Esc>
xnoremap <leader>" c"<C-r>""<Esc>
xnoremap <leader>' c'<C-r>"'<Esc>


"""""""""""""""""""""""""
" Loading settings folder
"""""""""""""""""""""""""
source $HOME/.config/nvim/settings/nerdtree.vim
source $HOME/.config/nvim/settings/fzf.vim
source $HOME/.config/nvim/settings/vim-airline.vim
source $HOME/.config/nvim/settings/vim-floaterm.vim
source $HOME/.config/nvim/settings/coc.vim

