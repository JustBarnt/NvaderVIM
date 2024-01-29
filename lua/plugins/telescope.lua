return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = function()
        require 'user.plugins.telescope'.setup.telescope.keys()
    end,
    config = function()
        require 'user.plugins.telescope'.setup.telescope.setup()
    end,
  },
  --[[ {
      "nvim-telescope/telescope-file-browser.nvim",
      lazy = false,
      dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim"
      },
      config = function()
          require 'user.plugins.telescope'.setup.file_browser.setup()
          require 'user.plugins.telescope'.setup.file_browser.keys()
      end,
  } ]]
}
