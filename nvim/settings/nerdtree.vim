" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" /// NerdTree Binding ///
nnoremap <leader>b :NERDTreeFocus<CR>
nnoremap <silent> <C-n> :NERDTree<CR>
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
" Remove key bindings for NerdTrees
autocmd FileType nerdtree nunmap <buffer> <Leader>n
autocmd FileType nerdtree nunmap <buffer> <Leader>ne

let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" Use custom symbols for Git status
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  : '✹',
\ 'Staged'    : '✔︎',
\ 'Untracked' : '✭',
\ 'Renamed'   : '➜',
\ 'Unmerged'  : '═',
\ 'Deleted'   : '✖',
\ 'Dirty'     : '✗',
\ 'Clean'     : '✔︎',
\ 'Ignored'   : '☒',
\ 'Unknown'   : '?'
\ }
