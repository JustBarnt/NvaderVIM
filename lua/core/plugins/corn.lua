local corn = require "corn"
local exist, user_config = pcall(require, "user.config")
local cfg = exist and type(user_config) == "table" and user_config.corn or {}
local map = require("core.utils").map
local defaults = {
    sort_method = "severity",
    scope = "line",
    border_style = "rounded",
}

local M = {}

local setup = function()
    corn.setup(vim.tbl_extend("force", defaults, cfg))
end

local keys = function()
    map("n", "<leader>ct", "<CMD>CornToggle<CR>", { desc = "Toggle Corner Diagnostics" })
    map("n", "<leader>cs", "<CMD>CornScopeCycle<CR>", { desc = "Cycle Scope Types" })
end

M.keys = keys
M.setup = setup
return M
