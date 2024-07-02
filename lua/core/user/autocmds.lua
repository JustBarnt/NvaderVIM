local set = vim.opt_local
local api = vim.api

-- Lualine LSP Progress Setup
api.nvim_create_autocmd("User", {
  group = api.nvim_create_augroup("lualine_augroup", { clear = true }),
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

-- Use Troulbe for quickfix list
api.nvim_create_autocmd("QuickFixCmdPost", {
  desc = "Open quickfix list using Troubles prettier qflist",
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})

-- Terminal Setup
api.nvim_create_autocmd("TermOpen", {
  group = api.nvim_create_augroup("nvadervim-term-open", {}),
  desc = "Disable certain options in a neovim terminal instance",
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})

-- Enable spell checking for certain files
api.nvim_create_autocmd({ "FileType" }, {
  group = api.nvim_create_augroup("edit_text", { clear = true }),
  pattern = { "gitcommit", "markdown", "txt", "norg" },
  desc = "Enable spell checking for certain filetypes",
  callback = function()
    set.number = false
    set.relativenumber = false
    set.conceallevel = 3
    set.concealcursor = "nc"
    set.wrap = true
    set.spell = true
    set.spelllang = "en_us"
    set.linebreak = true
    set.breakat = " ^I!@*-+;:,./?"
    set.breakindent = true
  end,
})

api.nvim_create_autocmd({ "FileType" }, {
  group = api.nvim_create_augroup("nvader_conceall", { clear = true }),
  pattern = { "norg" },
  desc = "Enable conceallevel and concealcursor",
  callback = function()
    set.conceallevel = 3
    set.concealcursor = "nc"
  end,
})

-- Highlight text on yank
api.nvim_create_autocmd("TextYankPost", {
  group = api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Prevents comments from appearing on newlines after making a comment
api.nvim_create_autocmd("BufEnter", {
  desc = "Prevents a comment from automatically being inserted on a new line when a comment exists above",
  group = api.nvim_create_augroup("disable_auto_comment", { clear = true }),
  command = [[set formatoptions-=cro]],
})

-- Opens help tags in float
api.nvim_create_autocmd("BufWinEnter", {
  group = api.nvim_create_augroup("help-float", { clear = true }),
  pattern = "*",
  callback = function(event)
    local filetype = vim.bo[event.buf].filetype
    local file_path = event.match
    local filetypes = { "help", "markdown", "norg", "txt" }

    if file_path:match("/doc/") ~= nil then
      -- Only run if the filetype is a help file
      if vim.tbl_contains(filetypes, filetype) then
        -- Get the newly opened help window
        -- and attempt to open a Detour() float
        local help_win = vim.api.nvim_get_current_win()
        local ok = require("detour").Detour()

        -- If we successfully create a float of the help file
        -- Close the split
        if ok then
          vim.api.nvim_win_close(help_win, false)
        end
      end
    end
  end,
})

-- Format buffer on save
api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = "Formats buffer on save",
  group = api.nvim_create_augroup("format_on_save", { clear = true }),
  pattern = "*",
  callback = function(args)
    local conform = require("conform")
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
    if filetype ~= "php" or filetype ~= "xml" or filetype ~= "html" or filetype ~= "svelte" then
      conform.format({ bufnr = args.buf, lsp_fallback = false })
    end
  end,
})
