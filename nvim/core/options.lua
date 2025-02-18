local opt = vim.opt
local g = vim.g

-- Use Color Theme
opt.background = "dark"
vim.cmd("colorscheme gruvbox")

-- Encoding and file settings
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Syntax Highlighting & File Type Detection
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

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
opt.updatetime = 200
opt.timeoutlen = 200

-- Wildmenu for command-line completion
opt.wildmenu = true
opt.wildmode = { "longest:full", "full" }

-- Terminal colors
opt.termguicolors = true

-- Disable backups and swap files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

