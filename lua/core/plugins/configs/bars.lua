local has_bars, bars = pcall(require, "bars")

if not has_bars then
  error("Failed to load bars")
  return
end

bars.setup()
require("bars.colors").setup({})
