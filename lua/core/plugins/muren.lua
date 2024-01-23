local muren = require "muren"
local exist, user_config = pcall(require, "user.config")
local setup = exist and type(user_config) == "table" and user_config.muren or {}
local map = require("core.utils").map
local M = {}

muren.setup(setup)

local keys = function()
    map("n", "<leader>mt", "<CMD>MurenToggle<CR>", { desc = "Toggle Multiple Replace in Neovim" })
    map("n", "<leader>mf", "<CMD>MurenFresh<CR>", { desc = "Toggle Multiple Replace in Neovim" })
end

M.keys = keys

return M
