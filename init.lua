-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "
if not vim.g.vscode then
    require "core"
else
    require("core.keymaps").Default()
end
