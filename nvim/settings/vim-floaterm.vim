" Configuration example
let g:floaterm_keymap_new    = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_next   = '<F4>'
let g:floaterm_keymap_toggle = '<F5>'

nnoremap   <silent>   <F2>    :FloatermNew<CR>
tnoremap   <silent>   <F2>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F3>    :FloatermPrev<CR>
tnoremap   <silent>   <F3>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F4>    :FloatermNext<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   ft   :FloatermToggle<CR>
tnoremap   <silent>   ft   <C-\><C-n>:FloatermToggle<CR>
