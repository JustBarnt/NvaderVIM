local has_lazydev, lazydev = pcall(require, "lazydev")

if not has_lazydev then
  error("Failed to load lazydev")
  return
end

lazydev.setup({
  library = {
    {
      path = "luvit-meta/library",
      -- Only loads typings for the module when it detects the follow pattern
      words = { "vim%.uv" },
    },
    "lazy.nvim",
  },
  integrations = {
    lspconfig = false,
    cmp = true,
  },
})
