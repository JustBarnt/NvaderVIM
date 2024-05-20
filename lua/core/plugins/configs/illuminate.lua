local has_illuminate, illuminate = pcall(require, "illuminate")

if not has_illuminate then
  error("Failed to load illuminate")
  return
end

illuminate.configure {
  providers = {
    "regex",
    "treesitter",
    "lsp",
  },
}
