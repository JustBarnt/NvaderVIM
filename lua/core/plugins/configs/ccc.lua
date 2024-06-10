local has_ccc, ccc = pcall(require, "ccc")

if not has_ccc then
  error("Failed to load ccc")
  return
end

ccc.setup({
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})
