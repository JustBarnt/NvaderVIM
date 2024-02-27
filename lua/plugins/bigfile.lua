return {
    "LunarVim/bigfile.nvim",
    opts = function()
        return {
            filesize = 2,
            pattern = { ".log", ".xml", ".txt" },
            features = {
                "lsp",
                "treesitter",
                "syntax",
                "matchparen",
            }
        }
    end
}
