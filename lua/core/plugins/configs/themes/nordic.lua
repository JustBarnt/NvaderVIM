local has_nordic, nordic = pcall(require, "nordic")

if not has_nordic then
  error("Failed to load nordic")
  return
end

nordic.load({
  bold_keywords = true,
  transparent_bg = true,
})
