local has_precog, precognition = pcall(require, "precognition")

if not has_precog then
  error("Failed to load precognition")
  return
end

local map = require("core.utils").map

precognition.setup({
  startVisible = true,
  showBlankVirtLine = false,
  highlightColor = { link = "@constant" },
})

map("n", "<leader>pt", "<CMD>Precognition toggle<CR>", { desc = "Toggle Precognition" })
