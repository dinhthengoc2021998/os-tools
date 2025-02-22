return {
  -- MASON 
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end,
  },
  -- MASON LSPCONFIG
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup{
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "dockerls",
          "yamlls",
          "ansiblels",
        },
        automatic_installation=true
      }
    end,
  },
  -- NVIM LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      -- LuaScript
      lspconfig.lua_ls.setup({})

      -- Python
      lspconfig.pyright.setup({})

      -- Bash
      lspconfig.bashls.setup({})

      -- Docker
      lspconfig.dockerls.setup({})

      -- Kubernetes & YAML
      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemas = {
              kubernetes = "/*.k8s.yaml",
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
          },
        },
      })

      -- Ansible
      lspconfig.ansiblels.setup({})

      -- Keybindings for LSP navigation
      local vim = vim
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    end,
  }
}
