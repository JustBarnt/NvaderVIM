if not pcall(require, "nvim-treesitter") then
    return
end

local treesitter = require "nvim-treesitter.configs"
local exist, user_config = pcall(require, "user.config")
local parsers = exist and type(user_config) == "table" and user_config.ensure_installed.parsers or {}
local config = exist and type(user_config) == "table" and user_config.treesitter or {}

treesitter.setup({
    ensure_installed = parsers,
    indent = {
        enable = true,
    },
    highlight = config.Highlight,
    refactor = config.Refactor,
    context_commentstring = require("ts_context_commentstring").setup({
        enable_autocmd = false,
    }),
    textobjects = config.Textobjects,
})
