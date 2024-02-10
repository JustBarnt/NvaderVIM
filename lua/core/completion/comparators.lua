local M = {}

M.compare = function(kind)
    return function(item1, item2)
        if item1:get_kind() == kind then
            return false
        end

        if item2:get_kind() == kind then
            return true
        end
    end
end

return M
