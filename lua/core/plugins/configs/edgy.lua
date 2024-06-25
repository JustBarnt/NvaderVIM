local has_edgy, edgy = pcall(require, "edgy")

if not has_edgy then
  error("Failed to load edgy")
  return
end

local map = require("core.utils").map

map("n", "<leader>ue", function()
  edgy.toggle()
end, { desc = "Edgy Toggle" })

map("n", "<leader>uE", function()
  edgy.select()
end, { desc = "Edgy Select Window" })

edgy.setup({
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
})
