local vim_opts = require("core.utils").vim_options

-- Assumes you are on windows with python installed in you appdata folder (default) install path
-- local home_path = os.getenv("HOMEPATH")
-- vim.g.python3_host_prog = "C:" .. home_path .. "/AppData/Local/Programs/Python/Python3/python.exe"

vim.filetype.add({
    extension = {
        postcss = "css",
    },
})
vim.opt.shortmess:append "sWAIcCqF"

vim_opts({
    ---@class vim.opt
    opt = {
        foldenable = false,
        numberwidth = 2,
        relativenumber = true,
        number = true,
        pumblend = 17,
        wildmode = "longest:full",
        wildoptions = "pum",
        
        termguicolors = true,
        showmode = false,
        showcmd = true,
        cmdheight = 0,
        incsearch = true,
        showmatch = true,
        ignorecase = true,
        smartcase = true,
        hidden = true,
        equalalways = false,
        splitright = true,
        splitbelow = true,
        updatetime = 1000,
        hlsearch = true,
        scrolloff = 10,
        cursorline = false,
        autoindent = true,
        cindent = true,
        wrap = false,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        expandtab = true,
        breakindent = false,
        showbreak = string.rep(" ", 3),
        linebreak = false,
        foldmethod = "marker",
        foldlevel = 0,
        modelines = 1,
        belloff = "all",
        clipboard = "unnamedplus",
        inccommand = "split",
        swapfile = false,
        shada = { "!", "'1000", "<50", "s10", "h", "rA", "rB" },
        mouse = "a",
        joinspaces = false,
        list = false,
        listchars = { eol = "󰌑" },
        fillchars = { eob = "~" },
        undodir = vim.fn.stdpath "state" .. "\\undotree\\",
        undofile = true,
        signcolumn = "yes",
        colorcolumn = "",
    },
})

local exist, config = pcall(require, "user.config")
local opts = exist and type(config) == "table" and config.user_options or {}
vim_opts(opts)
