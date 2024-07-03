local has_cokeline, cokeline = pcall(require, "cokeline")

if not has_cokeline then
  error("Failed to load nvim-cokeline")
  return
end

local map = require("core.utils").map
local get_hex = require("cokeline.hlgroups").get_hl_attr
local is_picking_focus = require("cokeline.mappings").is_picking_focus
local is_picking_close = require("cokeline.mappings").is_picking_close

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3

cokeline.setup({
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
    end,
    bg = function()
      return get_hex("ColorColumn", "bg")
    end,
  },

  components = {
    {
      text = function(buffer)
        return (buffer.index ~= 1) and "▏" or ""
      end,
    },
    {
      text = "  ",
    },
    {
      text = function(buffer)
        return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. " " or buffer.devicon.icon
      end,
      fg = function(buffer)
        return (is_picking_focus() and yellow) or (is_picking_close() and red) or buffer.devicon.color
      end,
      italic = function()
        return (is_picking_focus() or is_picking_close())
      end,
      bold = function()
        return (is_picking_focus() or is_picking_close())
      end,
    },
    {
      text = " ",
    },
    {
      text = function(buffer)
        return buffer.filename .. "  "
      end,
      bold = function(buffer)
        return buffer.is_focused
      end,
    },
    {
      text = "󰖭",
      on_click = function(_, _, _, _, buffer)
        buffer:delete()
      end,
    },
    {
      text = "  ",
    },
  },
})

map("n", "<leader>,", function()
  require("cokeline.mappings").pick("focus")
end, { desc = "Pick a buffer to focus" })
