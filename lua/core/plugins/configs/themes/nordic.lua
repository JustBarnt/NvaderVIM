local has_nordic, nordic = pcall(require, "nordic")

if not has_nordic then
  error("Failed to load nordic")
  return
end

--[[
black0 = '#191D24',
black1 = '#1E222A',
black2 = '#222630',
gray0 = '#242933', -- bg
gray1 = '#2E3440',
gray2 = '#3B4252',
gray3 = '#434C5E',
gray4 = '#4C566A',
gray5 = '#60728A',
white0_normal = '#BBC3D4',
white0_reduce_blue = '#C0C8D8',
white1 = '#D8DEE9',
white2 = '#E5E9F0',
white3 = '#ECEFF4',
blue0 = '#5E81AC',
blue1 = '#81A1C1',
blue2 = '#88C0D0',

cyan
    base = '#8FBCBB',
    bright = '#9FC6C5',
    dim = '#80B3B2',
red
    base = '#BF616A',
    bright = '#C5727A',
    dim = '#B74E58',
orange
    base = '#D08770',
    bright = '#D79784',
    dim = '#CB775D',
yellow
    base = '#EBCB8B',
    bright = '#EFD49F',
    dim = '#E7C173',
green
    base = '#A3BE8C',
    bright = '#B1C89D',
    dim = '#97B67C',
magenta
    base = '#B48EAD',
    bright = '#BE9DB8',
    dim = '#A97EA1',
]]

local C = require("nordic.colors")

nordic.setup({
  bold_keywords = true,
  italic_comments = true,
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

    NoiceCmdline = { fg = C.orange.base, bg = C.gray1, bold = true },
    NoiceCmdlineIcon = { bg = C.gray1, fg = C.orange.bright },
    NoiceCmdlineIconSearch = { bg = C.gray1, fg = C.orange.bright },
    NoicePopupBorder = { fg = C.gray1, bg = C.gray1 },
    NoiceCmdlinePopup = { bg = C.gray1 },

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
