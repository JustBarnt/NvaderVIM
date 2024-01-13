local M = {}

M.make_plugin_spec = function(existing, new)
    if not existing then
        return vim.deepcopy(new)
    end

    for _, new_table in ipairs(new) do
        local exist = false

        for _, existing_table in ipairs(existing) do
            -- If tables match, update the existing table with the new table
            if existing_table[1] == new_table[1] then
                exist = true
                vim.tbl_deep_extend("force", existing_table, new_table)
                break
            end
        end

        if not exist then
            table.insert(existing, vim.deepcopy(new_table))
        end
    end
end



return M

