local opt = vim.opt
local keymap = vim.keymap
local api = vim.api
local cmd = vim.cmd
local g = vim.g

vim.g.mapleader = " "

-- Encoding and file settings
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Syntax Highlighting & File Type Detection
cmd("syntax on")
cmd("filetype plugin indent on")

-- Mouse Support
opt.mouse = "a"

-- Clipboard Integration
if vim.fn.has("win32") == 1 then
opt.clipboard = "unnamed"
else
opt.clipboard = "unnamedplus"
end

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.smartindent = true

-- UI Improvements
opt.showcmd = true
opt.showmode = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"

-- Splits behavior
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 300
opt.timeoutlen = 300

-- Wildmenu for command-line completion
opt.wildmenu = true
opt.wildmode = { "longest:full", "full" }

-- Terminal colors
opt.termguicolors = true

-- Disable backups and swap files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste over highlight word
keymap.set("x", "<leader>p", '"_dP') -- deleted text not stored in clipboard
opt.colorcolumn = "80"

-- Change Color lineNumber above/below of current line
api.nvim_set_hl(0, "LineNrAbove", { fg = "white" })
api.nvim_set_hl(0, "LineNrBelow", { fg = "#ead84e" })

