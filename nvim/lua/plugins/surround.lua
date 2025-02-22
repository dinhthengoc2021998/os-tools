return {
  "kylechui/nvim-surround",
  version = "*", -- Always get the latest stable version
  event = "VeryLazy", -- Load the plugin lazily
  config = function()
    require("nvim-surround").setup({})
  end,
}
