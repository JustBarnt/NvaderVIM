local has_neofusion, neofusion = pcall(require, "neofusion")

if not has_neofusion then
  error("Failed to load neofusion")
  return
end

neofusion.setup {
  overrides = {
    ["@keyword.php"] = { fg = "#35B5FF" },
  },
  transparent_mode = true,
}
