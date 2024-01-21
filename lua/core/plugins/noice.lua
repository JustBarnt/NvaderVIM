local noice = require("noice")
local exist, user_config = pcall(require, "user.config")
local pkg = exist and type(user_config) == "table" and user_config.noice or {}
-- TODO: Use vim.tbl_deep_extend to merge configs together

noice.setup({
	routes = {
		{ -- Disables showing confirm messages aka things like "saving" a buffer
			filter = {
				event = "msg_show",
				kind = { "confirm", "confirm_sub", "wmsg", "search_count", "quickfix", "echo" },
			},
			opts = { skip = true },
		},
	},
	lsp = {
		-- Note: Disabled because I overwrite [window/showMessage] to display my own LSP errors
		hover = {
			silent = true,
		},
		message = {
			enabled = false,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = false,
		lsp_doc_border = true,
		inc_rename = false, -- Install inc_rename.nvim to use
		long_message_to_split = true,
	},
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
})
