local has_hbac, hbac = pcall(require, "hbac")
local map = require("core.utils").map

if not has_hbac then
  error("Failed to load hbac")
  return
end

map("n", "<leader>pb", "<CMD>Hbac toggle_pin<CR>", { desc = "Pin/Unpin Buffer" })

hbac.setup {
  autoclose = true,
  threshold = 5,
}
