local plugins = {
  {
    "nvim-treesitter/nvim-treesitter", -- Run Command "TSInstall all" to install all 
    opts = {
        ensure_installed = {
          -- High Level Programming Language
          "python",
          "bash",
          "javascript",
          "typescript",
          -- Low Level Programming Language
          "go",
          "java",
          "lua",
          "vim",
          -- Documents, Config files for DevOps
          "dockerfile",
          "terraform",
          "yaml",
          "ini",
          -- Data, Query, DB
          "json",
          "sql",
      },
    },
  },
  {
    -- In order to modify the `lspconfig` configuration:
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
   "williamboman/mason.nvim", -- Run Command "MasonInstallAll" to install all 
   opts = {
      ensure_installed = {
       "pyright",
       -- Formatting Python from null-ls
       "mypy",
       "ruff",
       "black",
      },
    },
  }
}
return plugins
