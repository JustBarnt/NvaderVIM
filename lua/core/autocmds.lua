local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd
local enabled = require 'core.utils'.enabled

-- TODO: Add check for user config to disable certain items
local exist, config = pcall(require, "user.config")
local cmds = exist and type(config) == "table" and config.autocmds or {}
local clear = { clear = true }

if enabled(cmds, 'disable_auto_comment') then
  cmd("BufEnter", {
    desc = "Disables create an commented new line when going to a new line",
    group = augroup("disable_auto_comment", clear),
    command = [[set formatoptions-=cro]]
  })
end

if enabled(cmds, 'highlight_yank') then
  cmd("TextYankPost", {
    desc = "Highlights text selection when yanking",
    group = augroup("highlight_yank", clear),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
end

if enabled(cmds, 'cursor_line') then
  cmd({ "InsertEnter", "WinEnter" }, {
    desc = "Shows cursor when entering the editor window",
    group = augroup("cursor_line", clear),
    pattern = "*",
    command = "set cursorline"
  })

  cmd({ "InsertEnter", "WinLeave" }, {
    desc = "Hides cursor when leaving the editor window",
    group = augroup("cursor_line", clear),
    pattern = "*",
    command = "set nocursorline"
  })
end

if enabled(cmds, "trailing_whitespace") then
  cmd({ "BufWritePre" }, {
    desc = "Clears trailing whitespace on save",
    group = augroup("trailing_whitespace", clear),
    pattern = "*",
    command = [[%s/\s\+$//e]],
  })
end

if enabled(cmds, "cursor_line_control") then
    vim.opt.cursorline = true
    local set_cursorline = function(event, value, pattern)
        cmd(event, {
            group = augroup("cursor_line_control", clear),
            pattern = pattern,
            callback = function()
                vim.opt_local.cursorline = value
            end,
        })
    end

    set_cursorline("WinLeave", false)
    set_cursorline("WinEnter", true)
    set_cursorline("FileType", false, "TelescopePrompt")
end

--[[
if enabled(cmds, "format_on_save") then
    cmd({ "BufWritePre" }, {
        desc = "Formats buffer on save",
        group = augroup("format_on_save", clear),
        pattern = "*",
        callback = function(args)
            local conform = require 'conform'
            local filetype = vim.api.nvim_buf_get_options(args.buf, 'filetype')
            if filetype ~= "php"  or filetype ~= "xml"
               or filetype ~= "html" or filetype ~= "svelte" then
               conform.format({ bufnr = args.buf, lsp_fallback = false })
            end

        end,
    })
end]]
