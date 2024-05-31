local has_gitsigns, gitsigns = pcall(require, "gitsigns")

if not has_gitsigns then
  error("Failed to load gitsigns")
  return
end

gitsigns.setup {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "|" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "|" },
  },
}
