"""""""""""""""""""""""
" Key Bindings Default
"""""""""""""""""""""""
" Set Leader Keys
let mapleader=" "
let maplocalleader=" "

vnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y

" Wrap Selection 
vnoremap ( c(<C-r>")<Esc>
vnoremap { c{<C-r>"}<Esc>
vnoremap [ c[<C-r>"]<Esc>
vnoremap " c"<C-r>""<Esc>
vnoremap ' c'<C-r>"'<Esc>
vnoremap ` c`<C-r>"`<Esc>
vnoremap < c<<C-r>"><Esc>

" Add Tabs for Indent/OutDent multiple-line selection
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Next Word without space
nnoremap <Leader>w /\S<CR>

" Navigate Error Next/Previous
nnoremap <silent> <Leader>ne :lua vim.diagnostic.goto_next({wrap = false})<CR>
nnoremap <silent> <Leader>pe :lua vim.diagnostic.goto_prev({wrap = false})<CR>
nnoremap <silent> <Leader>q :lua vim.diagnostic.setloclist()<CR>

" Shorten Pane Navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Resize splits using Ctrl + Arrow keys
nnoremap <C-Up>    :resize +2<CR>       " Increase height
nnoremap <C-Down>  :resize -2<CR>       " Decrease height
nnoremap <C-Left>  :vertical resize -2<CR> " Decrease width
nnoremap <C-Right> :vertical resize +2<CR> " Increase width

" Comment multiple lines in visual mode
vnoremap <C-/> :s/^/#/<CR>

" Scroll Down/Up
nnoremap <C-j> <C-d> " Scroll down with Ctrl+j
nnoremap <C-k> <C-u> " Scroll up with Ctrl+k
