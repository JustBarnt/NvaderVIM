-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if not vim.g.vscode then
    require "core"
    if vim.g.loaded_undotree then
        vim.g.undotree_WindowLayout = 2
    end
else
    require("core.keymaps").Default()
end
