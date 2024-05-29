local lualine = require("lualine.config")
local palette = require("neofusion.palette")

require("neofusion").setup {
  transparent_mode = true,
  overrides = {
    TelescopePromptNormal = { bg = palette.dark_aqua },
    TelescopePromptBorder = { bg = palette.dark_aqua, fg = palette.dark_aqua },
    TelescopePromptTitle = { bg = palette.dark_aqua, fg = palette.light_aqua },
    TelescopePreviewNormal = { bg = palette.dark4, fg = palette.light_aqua },
    TelescopePreviewBorder = { bg = palette.dark4, fg = palette.dark4 },
    TelescopePreviewTitle = { bg = palette.dark4, fg = palette.light_aqua },
    TelescopeResultsNormal = { bg = palette.dark4, fg = palette.light_aqua },
    TelescopeResultsBorder = { bg = palette.dark4, fg = palette.dark4 },
    TelescopeResultsTitle = { bg = palette.dark_aqua, fg = palette.light_aqua },
    TelescopeResultsComment = { fg = palette.light0 },
  },
}

lualine.apply_configuration {
  theme = require("neofusion.lualine"),
}
