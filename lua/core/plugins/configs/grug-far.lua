local has_grug, grug = pcall(require, "grug-far")

if not has_grug then
  error("Failed to load grug-far")
  return
end

grug.setup {}
