return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = function()
        require("core.plugins.todo-comments").keys()
    end,
    config = function()
        require("core.plugins.todo-comments").setup()
    end,
}
