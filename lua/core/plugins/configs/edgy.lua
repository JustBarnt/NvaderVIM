local has_edgy, edgy = pcall(require, "edgy")

if not has_edgy then
  error("Failed to load edgy")
  return
end

edgy.setup {
  options = {
    left = { size = 30 },
    right = { size = 80 },
    top = { size = 30 },
    bottom = { size = 30 },
  },
  ---@type(Edgy.View.Opts|string)[]
  top = {},
  ---@type(Edgy.View.Opts|string)[]
  bottom = {
    {
      ft = "Trouble",
      size = { height = 0.2 },
    },
    { ft = "qf", title = "QuickFix" },
  },
  ---@type(Edgy.View.Opts|string)[]
  left = {},
  ---@type(Edgy.View.Opts|string)[]
  right = {},
}
