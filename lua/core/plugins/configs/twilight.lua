local has_twilight, twilight = pcall(require, "twilight")

if not has_twilight then
  error("Failed to load twilight")
  return
end

twilight.setup({
  dimming = {
    alpha = 0.5,
  },
  context = 20,
  exclude = { "norg", "markdown", "txt", "help", "sql" },
})

twilight.enable()
