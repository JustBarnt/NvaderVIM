return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = function()
        require 'core.plugins.telescope'.telescope.keys()
    end,
    config = function()
        require 'core.plugins.telescope'.telescope.setup()
    end,
  },
  {
      "nvim-telescope/telescope-file-browser.nvim",
      lazy = false,
      dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim"
      },
      config = function()
          require 'core.plugins.telescope'.file_browser.setup()
          require 'core.plugins.telescope'.file_browser.keys()
      end,
  }
}
