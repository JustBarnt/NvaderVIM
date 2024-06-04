local has_tokyonight, tokyonight = pcall(require, "tokyonight")

if not has_tokyonight then
  error("Failed to load tokyonight")
  return
end

tokyonight.setup({
  transparent = true,
  styles = {
    functions = { bold = true },
    keywords = { bold = true },
    floats = "dark",
    sidebars = "dark",
  },
  on_highlights = function(hl, c)
    local highlight_overrides = require("core.ui.tokyonight")
    highlight_overrides.overrides(hl, c)
  end,
  on_colors = function(_) end,
})

vim.cmd([[colorscheme tokyonight-storm]])
