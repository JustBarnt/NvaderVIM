-- Define if user has nushell installed
vim.g.has_nushell = vim.fn.executable("nu") and true or false

-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
  require("core.user.keymaps")
  require("core.user.options")
  return
end

require("core")

if vim.fn.has("win32") == 1 then
  local ori_fnameescape = vim.fn.fnameescape
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.fn.fnameescape = function(...)
    local result = ori_fnameescape(...)
    return result:gsub("\\", "/")
  end
end
