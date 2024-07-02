local opt = vim.opt

if vim.fn.has("win32") == 1 then
  vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
  vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
    .. "$PSStyle.vim.opt.tputRendering = [System.Management.Automation.OutputRendering]::PlainText;"
    .. [[$PSDefaultParameterValues['vim.opt.t-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;]]
  vim.opt.shellredir = [[2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode]]
  vim.opt.shellpipe = [[2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode]]
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.completeslash = "slash"
end

if not vim.env.SSH_TTY then
  -- Set clipboard to use system if not in an SSH Session
  opt.clipboard = "unnamedplus" -- Use System Clipboard
end

opt.cmdheight = 0
opt.breakindentopt = "list:-1"
opt.colorcolumn = "100,120"
opt.completeopt = "menu,menuone,noselect,popup"
opt.confirm = true -- Show confirmation prompt on exiting a modified Buffer
opt.cursorline = true -- Highlights current Line
opt.expandtab = true -- Use spaces instead of tabs
opt.grepformat = "%f:%l:%c:%m"
opt.ignorecase = true -- Ignore Search Casing
opt.inccommand = "split" -- preview incremental substitutes
opt.laststatus = 3 -- Global Statusline
opt.list = true -- Show Invisible Chars like tabs|spaces
opt.mouse = "a" -- Enable Mouse
opt.number = true -- Show Line Numbers
opt.relativenumber = true -- Relative Line Numbers
opt.pumblend = 10 -- Popup Opacity
opt.pumheight = 10 -- Number of entries in a popup
opt.scrolloff = 999 -- Lines of context
opt.shiftround = true -- Round indented lines
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ I = true, c = true })
opt.showmode = false -- Don't show current mode since we display it the statusline
opt.sidescrolloff = 8 -- Columns on Context
opt.signcolumn = "yes" -- Always show the signcolumn so the window doesn't shift
opt.smartcase = true -- Don't ignore case when searching once a capital letter is sent
opt.smartindent = true -- Inserts indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows to the right of current
opt.splitkeep = "screen" -- Keeps text on the same line as the screen
opt.tabstop = 2 -- Number of spaces tabs count for

if not vim.g.vscode then
  opt.timeoutlen = 300 -- Lower timout length for keymaps when not in VSCODE
end

opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold:
opt.virtualedit = "block" -- Allow cursor to move where there is no text in Visual Block mode
opt.wildmode = "list:longest,list:full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum Window width
opt.wrap = false -- Disable line wrapping
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.smoothscroll = true

-- FOLDS
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldcolumn = "2"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.markdown_recommended_style = 0
