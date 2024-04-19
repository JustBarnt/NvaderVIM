local M = {}

--- Blend two rgb colors using alpha
---@param color1 string | number first color
---@param color2 string | number second color
---@param alpha number (0, 1) float determining the weighted average
---@return string color hex string of the blended color
local function blend(color1, color2, alpha)
  color1 = type(color1) == "number" and string.format("#%06x", color1) or color1
  color2 = type(color2) == "number" and string.format("#%06x", color2) or color2
  local r1, g1, b1 = color1:match "#(%x%x)(%x%x)(%x%x)"
  local r2, g2, b2 = color2:match "#(%x%x)(%x%x)(%x%x)"
  local r = tonumber(r1, 16) * alpha + tonumber(r2, 16) * (1 - alpha)
  local g = tonumber(g1, 16) * alpha + tonumber(g2, 16) * (1 - alpha)
  local b = tonumber(b1, 16) * alpha + tonumber(b2, 16) * (1 - alpha)
  return "#"
    .. string.format("%02x", math.min(255, math.max(r, 0)))
    .. string.format("%02x", math.min(255, math.max(g, 0)))
    .. string.format("%02x", math.min(255, math.max(b, 0)))
end

function M.dim(color, n)
  return blend(color, "#000000", n)
end

function M.brighten(color, n)
  return blend(color, "#ffffff", n)
end



M.icons = {
  -- ✗   󰅖 󰅘 󰅚 󰅙 󱎘 
  close = "󰅙 ",
  dir = "󰉋 ",
  lsp = " ", --   
  vim = " ",
  nvader = "󰢚",
  debug = " ",
  err = "",
  warn = "",
  info = "",
  hint =  "",
}

M.separators = {
  rounded_left = "",
  rounded_right = "",
  rounded_left_hollow = "",
  rounded_right_hollow = "",
  powerline_left = "",
  powerline_right = "",
  powerline_right_hollow = "",
  powerline_left_hollow = "",
  slant_left = "",
  slant_right = "",
  inverted_slant_left = "",
  inverted_slant_right = "",
  slant_ur = "",
  slant_br = "",
  vert = "│",
  vert_thick = "┃",
  block = "█",
  double_vert = "║",
  dotted_vert = "┊",
}
return M
