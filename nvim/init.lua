-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
  -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Debugging
  { "puremourning/vimspector" },

  -- Git
  { "tpope/vim-fugitive" },

  -- Defaults
  { "tpope/vim-sensible" },
  { "itchyny/lightline.vim" },
})

require("core.options")
require("core.keymaps")

-- Load specific plugin configurations
vim.cmd("source $HOME/.config/nvim/settings/nerdtree.vim")
vim.cmd("source $HOME/.config/nvim/settings/fzf.vim")
vim.cmd("source $HOME/.config/nvim/settings/vim-airline.vim")
vim.cmd("source $HOME/.config/nvim/settings/vim-floaterm.vim")
vim.cmd("source $HOME/.config/nvim/settings/coc.lua")

