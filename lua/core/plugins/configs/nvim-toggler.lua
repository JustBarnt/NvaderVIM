local has_toggler, toggler = pcall(require, "nvim-toggler")

if not has_toggler then
  error("Failed to load nvim-toggler")
  return
end

toggler.setup({})
