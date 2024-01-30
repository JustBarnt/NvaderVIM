local map = require('core.utils').map
return {
    "carbon-steel/detour.nvim",
    config = function()
        map("n", "<C-w><Enter>", ":Detour<CR>")
    end,
}
