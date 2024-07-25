return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>ue",
      function()
        require("edgy").toggle()
      end,
      desc = "Edgy Toggle"
    },
    {
      "<leader>uE",
      function()
        require("edgy").select()
      end,
      desc = "Edgy Select Window"
    }
  },
  opts = {
    bottom = {
      {
        ft = "noice",
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
    },
    right = {
      {
        ft = "grug-far",
        size = { width = 0.5 },
        title = "Find and Replace",
      },
    },
    keys = {
      ["<C-Right>"] = function(win)
        win:resize("width", 2)
      end,
      ["<C-Left>"] = function(win)
        win:resize("width", -2)
      end,
      ["<C-Up>"] = function(win)
        win:resize("height", 2)
      end,
      ["<C-Down>"] = function(win)
        win:resize("height", -2)
      end,
    },
  }
}
