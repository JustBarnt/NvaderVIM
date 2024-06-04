local has_reactive, reactive = pcall(require, "reactive")

if not has_reactive then
  error("Failed to load reactive")
  return
end

---@module "reactive"
reactive.setup({
  builtin = {
    cursorline = true,
    cursor = true,
    modemsg = true,
  },
})
