-- Plugin Manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Reload automatic
  { "famiu/nvim-reload" },

   -- Color Theme
  { "morhetz/gruvbox" },

  -- File Browser
  { "preservim/nerdtree" },
  { "xuyuanp/nerdtree-git-plugin" },
  { "ryanoasis/vim-devicons" },
  { "tiagofumo/vim-nerdtree-syntax-highlight" },

  -- File Search
  { "junegunn/fzf", build = "fzf#install()" },
  { "junegunn/fzf.vim" },

  -- Status Bar
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  -- Terminal Float
  { "voldikss/vim-floaterm" },

  -- Code Intelligence
  { "neoclide/coc.nvim", branch = "release" },
  { "jiangmiao/auto-pairs" },
  { "alvan/vim-closetag" },
  { "mattn/emmet-vim" },

  -- Code Syntax Highlight
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Debugging
  { "puremourning/vimspector" },

  -- Git
  { "tpope/vim-fugitive" },

  -- Defaults
  { "tpope/vim-sensible" },
  { "itchyny/lightline.vim" },
})

require("lua/core/options")
require("lua/core/keymaps")

-- Load specific plugin configurations
vim.cmd("source $HOME/.config/nvim/settings/nerdtree.vim")
vim.cmd("source $HOME/.config/nvim/settings/fzf.vim")
vim.cmd("source $HOME/.config/nvim/settings/vim-airline.vim")
vim.cmd("source $HOME/.config/nvim/settings/vim-floaterm.vim")
vim.cmd("source $HOME/.config/nvim/settings/coc.lua")

