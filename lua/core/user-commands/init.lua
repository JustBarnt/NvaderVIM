require "core.user-commands.legendary"
local command = vim.api.nvim_create_user_command

local harpoon = require "harpoon"

command("HarpoonAdd", function()
  harpoon:list():add()
end, { bang = false })

command("HarpoonMenu", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { bang = false })

command("HarpoonNext", function()
  harpoon:list():next()
end, { bang = false })

command("HarpoonPrev", function()
  harpoon:list():prev()
end, { bang = false })

command("HarpoonSelect", function(cmd)
  index = cmd.args and type(cmd.args) == "string" and tonumber(cmd.args) or ""
  harpoon:list():select(index)
end, { bang = false, nargs = "?" })
