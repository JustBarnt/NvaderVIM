local noice = require("noice")
local exist, user_config = pcall(require, "user.config")
local pkg = exist and type(user_config) == "table" and user_config.noice or {}
-- TODO: Use vim.tbl_deep_extend to merge configs together

noice.setup({
	popupmenu = {
		enabled = false,
	},
	routes = {
		{
			view = "mini",
			filter = {
				event = { "msg_show", "msg_showmode" },
				["not"] = {
					kind = { "confirm", "confirm_sub" },
				},
			},
		},
		{
			filter = {
				event = "cmdline",
				find = "^%s*[/?]",
			},
			view = "cmdline",
		},
	},
	lsp = {
		-- Note: Disabled because I overwrite [window/showMessage] to display my own LSP errors
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
		command_palette = true,
		lsp_doc_border = true,
		inc_rename = false, -- Install inc_rename.nvim to use
		long_message_to_split = true,
	},
	views = {
		cmdline_popup = {
			position = "50%",
			size = {
				width = 60,
				height = "auto",
			},
			border = {
				style = "none",
				padding = { 1, 1 },
			},
			filter_options = {},
			win_options = {
				winblend = 0,
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		notify = {
			replace = true,
		},
	},
})
