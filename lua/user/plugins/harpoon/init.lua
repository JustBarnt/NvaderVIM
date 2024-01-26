local M = {}
local map = require("core.utils").map
local harpoon = require("harpoon")
local conf = require("telescope.config").values

-- TODO: Handle user configuration
local exist, user_config = pcall(require, "user.config")
local harpoon_config = exist and type(user_config) == "table" and user_config.harpoon or {}

M.setup = function()
    harpoon:setup({ harpoon_config })
end

M.keys = function()
	-- Append current open file to our harpon list
	map("n", "<leader>ha", function()
		harpoon:list():append()
		local file_name = vim.api.nvim_buf_get_name(0)
		vim.notify("[Harpoon] Added " .. file_name .. " to list", vim.log.levels.INFO)
	end, { desc = "Harpoon Add" })

	-- Toggle a UI popup of or current harpooned items.
	map("n", "<leader>hl", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "Harpoon Toggle" })

	for i = 1, 5 do
		map("n", string.format("<leader>%s", i), function()
			harpoon:list():select(i)
		end, { desc = "Harpoon jump to file: [" .. i .. "]" })
	end
end

return M
