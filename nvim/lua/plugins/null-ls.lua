return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",  -- Bridge between Mason and null-ls
  },
  config = function()
    local null_ls = require("null-ls")
    local mason_null_ls = require("mason-null-ls")
    local vim = vim
    -- Force Mason to use system Python instead of its internal one
    vim.g.python3_host_prog = "/usr/bin/python3.10"  -- Adjust if needed

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,

        -- Python Formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Bash Formatting
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2" }, -- Indent with 2 spaces
        }),

        -- Bash Linting
        null_ls.builtins.diagnostics.shellcheck,
      },
    })

    -- Ensure required tools are installed automatically
    mason_null_ls.setup({
      ensure_installed = {
        "stylua",     -- Lua formatter
        "prettier",   -- JS/CSS/HTML formatter
        "black",      -- Python formatter
        "isort",      -- Python import sorter
        "shfmt",      -- Shell formatter
        "shellcheck", -- Shell formatter
      },
      automatic_installation = true, -- Auto install missing tools
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
