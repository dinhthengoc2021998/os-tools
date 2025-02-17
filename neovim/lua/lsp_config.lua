local lspconfig = require'lspconfig'

-- Lua LSP (for Neovim)
-- lspconfig.lua_ls.setup{}

-- JavaScript/TypeScript
lspconfig.ts_ls.setup{}

-- Python
lspconfig.pyright.setup{}
lspconfig.pylyzer.setup{}
lspconfig.pyre.setup{}
lspconfig.pylsp.setup{}

-- C/C++ LSP
lspconfig.clangd.setup{}

