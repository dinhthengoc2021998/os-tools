local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  -- For Python development 
  formatting.ruff,
  formatting.mypy,
  formatting.black,

  -- formatting.prettier,
  -- formatting.stylua,
  lint.shellcheck,
}

null_ls.setup {
   debug = true,
   sources = sources,
}
