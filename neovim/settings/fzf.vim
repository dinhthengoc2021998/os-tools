""""""""""""""
" Plug fzf
""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight':'Comment'} }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

""""""""""""""
" Plug fzf.vim
""""""""""""""
" Initialize configuration dictionary
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
let g:fzf_vim.preview_window = []

map <silent> ff :Files<CR>
map <silent> <C-F6> :History<CR>

" Default: Use quickfix list
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }

" Use location list instead of quickfix list
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#location(list) }
