local has_fastaction, fastaction = pcall(require, "fastaction")
local map = require("core.utils").map

if not has_fastaction then
  error("Failed to load fast action")
  return
end

fastaction.setup({})
