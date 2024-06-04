local has_lazydev, lazydev = pcall(require, "lazydev")

if not has_lazydev then
  error("Failed to load lazydev")
  return
end

lazydev.setup({
  library = {
    "luvit-meta/library",
  },
})
