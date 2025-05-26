return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  keys = {
    { "<leader>sf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>f", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
  }
}
