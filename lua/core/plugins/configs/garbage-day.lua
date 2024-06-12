local has_gd, garbage_day = pcall(require, "garbage-day")

if not has_gd then
  error("Failed to load Garbage-day")
  return
end

garbage_day.setup({
  aggressive_mode = true,
})
