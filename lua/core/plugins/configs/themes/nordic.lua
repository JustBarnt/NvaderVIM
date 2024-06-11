local has_nordic, nordic = pcall(require, "nordic")

if not has_nordic then
  error("Failed to load nordic")
  return
end

local C = require("nordic.colors")

nordic.setup({
  bold_keywords = true,
  italic_comments = false,
  transparent_bg = true,
  bright_border = true,
  reduced_blue = true,
  swap_backgrounds = false,
  override = {
    TelescopeNormal = { bg = C.gray1 },
    TelescopeTitle = { bg = C.orange.base, fg = C.black0, bold = true },
    TelescopeBorder = { fg = C.black0, bg = C.black0 },

    TelescopePromptTitle = { bg = C.orange.base, fg = C.black0, bold = true },
    TelescopePromptNormal = { bg = C.black2 },
    TelescopePromptBorder = { bg = C.black2, fg = C.black2 },
    TelescopePromptPrefix = { bg = C.black2, fg = C.orange.bright },

    TelescopeResultsNormal = { bg = C.gray1 },
    TelescopeResultsBorder = { bg = C.gray1, fg = C.gray1 },
    TelescopeResultsTitle = { bg = C.orange.base, fg = C.black0, bold = true },

    TelescopePreviewNormal = { bg = C.black2 },
    TelescopePreviewTitle = { bg = C.blue2, fg = C.black0, bold = true },
    TelescopePreviewBorder = { bg = C.black2, fg = C.black2 },

    TelescopeSelection = { bg = C.gray1, fg = C.orange.bright },
    TelescopeSelectionCaret = { fg = C.orange.bright, bg = C.gray1, bold = true },
    TelescopeMultiIcon = { fg = C.orange.bright, bg = C.gray1, bold = true },
    TelescopeMultiSelection = { bg = C.gray1 },
    TelescopePreviewLine = { bg = C.gray1 },

    LazyNormal = { bg = C.gray1 },
    LazyH1 = { bg = C.orange.base, fg = C.black0, bold = true },
    LazySpecial = { fg = C.orange.base },
    LazyCommitType = { fg = C.orange.base },

    WhichKeyFloat = { bg = C.gray1 },
    WhichKeyBorder = { fg = C.black0, bg = C.gray1 },

    Pmenu = { bg = C.gray1 },
  },
  noice = {
    style = "flat",
  },
  telescope = {
    style = "flat",
  },
  ts_context = {
    dark_background = true,
  },
})
