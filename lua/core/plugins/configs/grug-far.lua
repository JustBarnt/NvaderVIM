local map = require("core.utils").map
local has_grug, grug = pcall(require, "grug-far")

if not has_grug then
  error("Failed to load grug-far")
  return
end

grug.setup {}

map("n", "<leader>fr", function()
  require("grug-far").grug_far()
end, { desc = "Find and Replace with Grug" })
