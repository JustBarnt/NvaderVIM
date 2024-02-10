return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local hooks = require "ibl.hooks"
        local scope = "focus"
        local indent = "passive"

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "focus", { fg = "#C4A7E7" })
            vim.api.nvim_set_hl(0, "passive", { fg = "#41425e" })
        end)

        require("ibl").setup({
            scope = { highlight = scope },
            indent = { highlight = indent },
        })
    end,
}
