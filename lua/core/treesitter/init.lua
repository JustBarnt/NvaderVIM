local M = {}

-- TODO: Move to user config

M.Highlight = {
	enable = true,

    -- TODO: Create Queries for Svelte the highlight/indent queries for special blocks don't seem to match
    -- NOTE: May need to enable for Svelte to get it to respect Svelte Special blocks
    -- NOTE: https://github.com/Himujjal/tree-sitter-svelte?tab=readme-ov-file#for-neovim-peeps
	additional_vim_regex_highlighting = false,
}

M.Refactor = {
	highlight_definitions = {
		enable = true,
		disable = { "xml" },
		clear_on_cursor_move = true,
	},

	highlight_current_scope = { enable = false },

	smart_rename = {
		enable = true,
		keymaps = {
			smart_rename = "<leader>cR",
		},
	},

	navigation = false,

	incremental_selection = {
		enable = true,
	},
}

M.Textobjects = {
	move = {
		enable = true,
		set_jumps = true,

		goto_next_start = {
			["]p"] = "@parameter.inner",
			["]m"] = "@function.outer",
			["]]"] = "@class.outer",
		},
		goto_next_end = {
			["]M"] = "@function.outer",
			["]["] = "@class.outer",
		},
		goto_previous_start = {
			["[p"] = "@parameter.inner",
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
		},
	},

	select = {
		enable = true,

		-- Jump forward automatically like targets.vim
		lookahead = true,

		keymaps = {
			["af"] = "@function.outer",
			["if"] = "@function.inner",

			["ac"] = "@conditional.outer",
			["ic"] = "@conditional.inner",

			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",

			["av"] = "@variable.outer",
			["iv"] = "@variable.inner",
		},
	},
}

return M
