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
}
