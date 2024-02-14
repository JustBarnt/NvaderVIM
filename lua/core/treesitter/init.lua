if not pcall(require, "nvim-treesitter") then
    return
end

local treesitter = require "nvim-treesitter.configs"
local exist, user_config = pcall(require, "user.config")
local parsers = exist and type(user_config) == "table" and user_config.ensure_installed.parsers or {}
local config = exist and type(user_config) == "table" and user_config.treesitter or {}

local list = require("nvim-treesitter.parsers").get_parser_configs()

---@class ParserInfo[]
list.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        cxx_standard = "c++14",
        use_makefile = true,
    },
    maintainers = { "@JoeyGrajciar", "@vhyrro" },
}

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
