local has_markview, markview = pcall(require, "markview")

if not has_markview then
  error("Failed to load markview")
  return
end

markview.setup()
