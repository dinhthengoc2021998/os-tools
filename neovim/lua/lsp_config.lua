local lspconfig = require'lspconfig'

-- JavaScript/TypeScript
lspconfig.ts_ls.setup{}

-- Python
lspconfig.pyright.setup{}

-- Lua LSP (for Neovim)
lspconfig.lua_ls.setup{}

-- C/C++ LSP
lspconfig.clangd.setup{}
