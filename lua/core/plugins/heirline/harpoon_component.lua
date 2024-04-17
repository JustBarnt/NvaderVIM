local M = {}

local harpoonline = require "harpoonline"
harpoonline.setup {
  on_update = function()
    vim.cmd.redrawstatus()
  end,
}

function M.harpoon_component()
  return {
    provider = function()
      return " " .. harpoonline.format() .. " "
    end,
  }
end

return M
