return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = function()
        require 'core.plugins.telescope'.keymaps()
    end,
    config = function()
        require 'core.plugins.telescope'
    end,
  },
  {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim"
      }
  }
}
