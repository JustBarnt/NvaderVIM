return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    -- note: not permanent this will move
    config = function()
      local map = require 'core.utils'.map
      local builtin = require 'telescope.builtin'

      map("n", "<leader>ff", "<cmd>telescope find_files<cr>", { desc = "find files" })
      map("n", "<leader>fh","<cmd>telescope help_tags<cr>", { desc = "help tags" })
    end,
  }
}
