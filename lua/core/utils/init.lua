local api = vim.api
local M = {}

local vim_options = function(options)
	if options ~= nil then
		for scope, table in pairs(options) do
			for setting, value in pairs(table) do
				vim[scope][setting] = value
			end
		end
	end
end

local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local enabled = function(group, opt)
	return group == nil or group[opt] == nil or group[opt] == true
end

local autocmd = function(args)
	local event = args[1]
	local group = args[2]
	local callback = args[3]

	vim.api.nvim_create_autocmd(event, {
		group = group,
		buffer = args[4],
		callback = function()
			callback()
		end,
		once = args.once,
	})
end

---@private
local function create_window_without_focus()
	local prev = api.nvim_get_current_win()
	vim.cmd.new()
	local new = api.nvim_get_current_win()
	api.nvim_set_current_win(prev)
	return new
end

---@private
--- Like vim.fn.bufwinid except it works across tabpages
local function bufwinid(bufnr)
	for _, win in ipairs(api.nvim_list_wins()) do
		if api.nvim_win_get_buf(win) == bufnr then
			return win
		end
	end
end

--- Shows a document in a floating window as opposed to opening it as a non-floating window
---
--- @param location table (`Location`|`LocationLink`)
--- @param offset_encoding "utf-8"|"utf-16"|"uft-32"
--- @param opts table|nil options
---         - reuse_win (boolean) Jump to existing window if buffer is already open
---         - focus (boolean) Whether to focus/jump to location is possible. Defaults to true
---@return boolean `true` if succeeded
local show_document_floating = function(location, offset_encoding, opts)
	local uri = location.uri or location.targetUri
	if uri == nil then
		return false
	end

	if offset_encoding == nil then
		vim.notify_once("show_document_floating must be called with a valid offset encoding", vim.log.levels.WARN)
	end

	local bufnr = vim.uri_to_bufnr(uri)

	opts = opts or {}
	local focus = vim.F.if_nil(opts.focus, true)
	if focus then
		vim.cmd("normal! m'")

		local from = { vim.fn.bufnr("%"), vim.fn.line("."), vim.fn.col("."), 0 }
		local items = { { tagname = vim.fn.expand("<cword>"), from = from } }
		vim.fn.settagstack(vim.fn.win_getid(), { items = items }, "t")
	end

	local win = opts.reuse_win and bufwinid(bufnr)
		or focus and api.nvim_get_current_win()
		or create_window_without_focus()

	api.nvim_buf_set_option(bufnr, "buflisted", true)
    api.nvim_win_set_buf(win, bufnr)
    if focus then
        api.nvim_set_current_win(win)
    end


end

M.vim_options = vim_options
M.map = map
M.enabled = enabled
M.autocmd = autocmd

return M
