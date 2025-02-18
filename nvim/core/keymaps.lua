vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Example key bindings (add more as needed)
keymap("n", "<leader>nt", ":NERDTreeToggle<CR>", opts)
keymap("n", "<leader>ff", ":FZF<CR>", opts)
keymap("n", "<leader>ft", ":FloatermToggle<CR>", opts)

