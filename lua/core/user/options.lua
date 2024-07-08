local opt = vim.opt
local icons = require("core.user.icons")

-- if vim.fn.has("win32") == 1 then
--   vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
--   vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
--     .. "$PSStyle.vim.opt.tputRendering = [System.Management.Automation.OutputRendering]::PlainText;"
--     .. [[$PSDefaultParameterValues['vim.opt.t-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;]]
--   vim.opt.shellredir = [[2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode]]
--   vim.opt.shellpipe = [[2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode]]
--   vim.opt.shellquote = ""
--   vim.opt.shellxquote = ""
--   vim.opt.completeslash = "slash"
-- end

if not vim.env.SSH_TTY then
  -- Set clipboard to use system if not in an SSH Session
  opt.clipboard = "unnamedplus" -- Use System Clipboard
end

opt.cmdheight = 0
opt.scrolloff = 999

opt.shortmess:append({ I = true, c = true })
opt.virtualedit = "block"
opt.signcolumn = "yes"
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.showtabline = 2
opt.laststatus = 3

opt.swapfile = true
opt.backup = false
opt.undofile = true
opt.undolevels = 10000

opt.hlsearch = false
opt.incsearch = true
opt.cursorline = true
opt.cursorlineopt = "number"

opt.modeline = false

opt.timeout = true
opt.timeoutlen = not vim.g.vscode and 250 or 500

opt.updatetime = 500

opt.confirm = true

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = ""

opt.splitkeep = "cursor"

opt.smoothscroll = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true

opt.fillchars = {
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  fold = "⠀",
  eob = " ",
  diff = "┃",
  msgsep = " ",
  foldsep = " ",
  foldclose = icons.fold.closed,
  foldopen = icons.fold.open,
}

opt.numberwidth = 3

opt.colorcolumn = "100,120"
opt.breakindentopt = "list:-1"
opt.grepformat = "%f:%l:%c:%m"
opt.ignorecase = true
opt.inccommand = "split"
opt.mouse = "a"
opt.pumblend = 10
opt.pumheight = 10
opt.showmode = false
opt.sidescrolloff = 8
opt.smartcase = true

opt.spelllang = { "en" }

opt.splitbelow = true
opt.splitright = true

opt.wildmode = "list:longest,list:full"

opt.winminwidth = 5

opt.wrap = false
