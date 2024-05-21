local has_flash, flash = pcall(require, "flash")

if not has_flash then
  error("Failed to load flash")
  return
end

flash.setup {
  ---@type table<string, Flash.Config>
  modes = {
    char = {
      jump_labels = true,
    },
    treesitter = {
      search = { incremental = true },
    },
  },
}
flash.toggle(false)
