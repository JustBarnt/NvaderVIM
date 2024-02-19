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

--- Closes empty windows from neovim
--- returns current listed windows and a list of closed windows
---@param windows any[]
---@return {windows:any[], deleted: any[]}
function M.close_empty_wins(windows)
    local closed_win
    for i = 1, #windows do
        if vim.tbl_isempty(windows[i]) then
            vim.api.nvim_win_close(windows[1], true)
            table.insert(closed_win, windows[1])
        end
    end

    vim.print("Windows Closed: " .. tostring(closed_win))

    return {windows, closed = closed_win}
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

local lsp_hover_debug = function()
    local clients = vim.lsp.get_active_clients()

    for _, client in ipairs(clients) do
        vim.cmd([[redir >> lsp_log.txt]])
        vim.inspect(client)
        local result, err = vim.lsp.buf_request_sync(0, "textDocument/hover", vim.lsp.util.make_position_params(), 1000)
        vim.inspect(result)
    end
end

M.vim_options = vim_options
M.map = map
M.enabled = enabled
M.autocmd = autocmd

return M
