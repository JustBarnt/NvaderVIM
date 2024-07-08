local has_twilight, twilight = pcall(require, "twilight")

if not has_twilight then
  error("Failed to load twilight")
  return
end

twilight.setup({
  dimming = {
    alpha = 0.5,
  },
  treesitter = true,
  expand = {
    "function",
    "function_call",
    "method_call",
    "method",
    "table",
    "field",
    "if_statement",
  },
  exclude = { "norg", "markdown", "txt", "help", "sql" },
})

twilight.enable()
