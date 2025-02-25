return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "rounded", -- Customize border
      blend = 10,         -- Transparency
      dimensions = {
        height = 0.8,
        width = 0.8,
      },
    })

    -- Keymaps
    local vim = vim 
    vim.keymap.set("n", "<leader>ft", function() require("FTerm").toggle() end, { silent = true })
    vim.keymap.set("t", "<leader>ft", function() require("FTerm").toggle() end, { silent = true })
  end,
}
