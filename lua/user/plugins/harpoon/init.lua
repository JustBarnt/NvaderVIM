local map = require("core.utils").map
local harpoon = require "harpoon"

harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
})

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
