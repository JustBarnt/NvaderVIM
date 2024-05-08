local vim_opts = require("core.utils").vim_options
local exist, config = pcall(require, "user.config")
local opts = exist and type(config) == "table" and config.options or {}

if vim.fn.has("win32") == 1 then
  vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
  vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
    .. "$PSStyle.vim.opt.tputRendering = [System.Management.Automation.OutputRendering]::PlainText;"
    .. [[$PSDefaultParameterValues['vim.opt.t-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;]]
  vim.opt.shellredir = [[2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode]]
  vim.opt.shellpipe = [[2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode]]
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

vim.opt.shortmess = {
  c = true, -- Do not show completion messages
  F = true, -- Do not show file info when editing
  I = true, -- do not show intro message
}

---@class vim.opt
local default_opt = {
  opt = {
    --Tabs
    tabstop = 2,
    vartabstop = "2",
    shiftwidth = 0,
    softtabstop = -1,
    expandtab = true,
    cindent = true,

    -- Line Numbers
    relativenumber = true,
    number = true,
    signcolumn = "yes",
    statuscolumn = " %s%=%{v:relnum?v:relnum:v:lnum}%#WinSeparator#  ",

    -- Popup Menu
    pumblend = 20,
    wildmode = "longest:full",
    wildoptions = "pum,tagfile,fuzzy",

    -- Cmdline \\ Searching
    showmode = false,
    showcmd = false,
    cmdheight = 0,
    incsearch = true,
    showmatch = true,
    ignorecase = true,
    smartcase = true,
    hlsearch = true,

    -- Buffer Options
    hidden = true,
    equalalways = false,
    splitkeep = "screen",
    splitright = true,
    splitbelow = true,

    -- Keypress Response
    updatetime = 250,
    timeoutlen = 300,

    -- Misc
    termguicolors = true,
    backup = false,
    scrolloff = 10,
    cursorline = false,
    wrap = false,
    breakindent = true,
    belloff = "all",
    clipboard = "unnamedplus",
    inccommand = "split",
    swapfile = false,
    mouse = "a",
    list = true,
    fillchars = { eob = " " },
    listchars = { extends = "⟩", precedes = "⟨", trail = "·", tab = "╏ ", nbsp = "␣" },
    foldenable = false,
    undofile = true,
    colorcolumn = "120",
  },
}

local merged_opts = vim.tbl_deep_extend("force", default_opt, opts)
vim_opts(merged_opts)
