return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = function()
        require("user.plugins.todo-comments").keys()
    end,
    config = function()
        require("user.plugins.todo-comments").setup()
    end,
}
