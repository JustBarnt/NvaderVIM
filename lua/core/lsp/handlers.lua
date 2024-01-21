local M = {}

-- Custom function for handling <K> when peeking into a definition with multple LSP attached
function M.peek_definition()
	local clients = vim.lsp.get_active_clients()

	for _, client in ipairs(clients) do
		local result, err = vim.lsp.buf_request_sync(0, "textDocument/hover", vim.lsp.util.make_position_params(), 1000)
		print(vim.inspect(result))
		print(vim.inspect(err))
	end
end


vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
    print(vim.inspect(result))
    print(vim.inspect(ctx))

    vim.notify(vim.inspect(result))
end

-- Override LSP diagnostics support if its supported.
vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.handlers["textDocument/publishDiagnostics"], {
		signs = { severity_limit = "Error" },
		underline = { severity_limit = "Warning" },
		virtual_text = true,
	})

vim.lsp.handlers["window/showMessage"] = require("core.lsp.message")

local on_list = function(options)
	vim.fn.setqflist({}, " ", options)
	vim.api.nvim_command("cfirst")
end

M.on_list = on_list
return M
