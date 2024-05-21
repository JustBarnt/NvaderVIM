local telescope = require("telescope")
local has_grapple, grapple = pcall(require, "grapple")
local has_portal, portal = pcall(require, "portal")

if not has_grapple then
  error("Failed to load grapple", vim.log.levels.ERROR)
  return
end

if not has_portal then
  error("Failed to load portal", vim.log.levels.ERROR)
  return
end

grapple.setup {
  scope = "cwd",
  win_opts = {
    width = 0.5,
    height = 0.25,
    border = "rounded",
  },
  statusline = {
    icon = "",
    active = "[%s]",
    inactive = " %s ",
  },
}

portal.setup {
  window_options = {
    width = 50,
    height = 5,
    border = "rounded",
  },
}

pcall(telescope.load_extension, "grapple")
