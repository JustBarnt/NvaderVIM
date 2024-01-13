local M = {}

M.vim_options = function(options)
    if options ~= nil then
        for scope, table in pairs(options) do
            for setting, value in pairs(table) do
                vim[scope][setting] = value
            end
        end
    end
end

M.enabled = function(group, opt)
    return group == nil or group[opt] == nil or group[opt] == true
end

return M
