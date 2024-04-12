local vim_opts = require("core.utils").vim_options
local exist, config = pcall(require, "user.config")
local opts = exist and type(config) == "table" and config.options or {}

vim.opt.shortmess = {
  c = true, -- Do not show completion messages
  F = true, -- Do not show file info when editing
  I = true, -- do not show intro message
}

---@class vim.opt
local default_opt = {
  opt = {
    commentstring = "",
    numberwidth = 5,
    statuscolumn = " %s%=%{v:relnum?v:relnum:v:lnum}%#WinSeparator#  ",
    relativenumber = true,
    number = true,
    pumblend = 0,
    winblend = 0,
    pumheight = 10,
    background = "dark",
    wildmode = "longest:full",
    wildoptions = "pum",
    termguicolors = true,
    backup = false,
    showmode = false,
    showcmd = false,
    cmdheight = 0,
    incsearch = true,
    showmatch = true,
    ignorecase = true,
    smartcase = true,
    hidden = true,
    equalalways = false,
    splitkeep = "screen",
    splitright = true,
    splitbelow = true,
    updatetime = 250,
    timeoutlen = 300,
    hlsearch = true,
    scrolloff = 10,
    cursorline = false,
    autoindent = true,
    cindent = true,
    wrap = false,
    breakindent = true,
    belloff = "all",
    clipboard = "unnamedplus",
    inccommand = "split",
    swapfile = false,
    mouse = "a",
    joinspaces = false,
    list = true,
    fillchars = { eob = " " },
    listchars = { tab = "» ", trail = "·", nbsp = "␣" },
    foldenable = false,
    undofile = true,
    signcolumn = "yes",
    colorcolumn = "120",
  },
}

local merged_opts = vim.tbl_deep_extend("force", default_opt, opts)
vim_opts(merged_opts)
