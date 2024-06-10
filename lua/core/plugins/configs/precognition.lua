local has_precog, precognition = pcall(require, "precognition")

if not has_precog then
  error("Failed to load precognition")
  return
end

precognition.setup({})
