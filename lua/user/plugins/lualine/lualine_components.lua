local M = {}
local basename = vim.fs.basename

M.harpoon_component = function()
    local harpoon = require "harpoon"
    local total_harpoons = harpoon:list():length()

    if total_harpoons == 0 then
        return ""
    end

    local current_mark = "_"

    local items = harpoon:list().items
    local buf = vim.api.nvim_buf_get_name(0)

    for i = 1, total_harpoons do
        if basename(items[i].value) == basename(buf) then
            current_mark = tostring(i);
            break;
        end
    end

    return string.format("󱡅 %s/%d", current_mark, total_harpoons)
end

return M
