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
nnoremap <silent> <Leader>ne :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <Leader>pe :lua vim.diagnostic.goto_prev()<CR>

" Shorten Pane Navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
