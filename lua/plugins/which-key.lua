return {
    "folke/which-key.nvim",
    lazy = true,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}
