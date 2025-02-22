return {
  "mbbill/undotree",
  config = function()
    local vim = vim
    -- Keybinding to toggle UndoTree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

    -- Optional: Persistent undo (ensures undo history is saved across sessions)
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
  end,
}

