-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Do not load plugins if I have to open VSCode for some rare reason
if not vim.g.vscode then
    require 'core.lazy'
else
    require 'core.keymaps' -- Still want out basic keymaps, those work just fine in VSCode
end

