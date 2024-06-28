local has_markdown, markdown = pcall(require, "render-markdown")

if not has_markdown then
  error("Failed to load markdown")
  return
end

markdown.setup({})
