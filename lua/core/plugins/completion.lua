local ok, _ = pcall(require, "lspkind")
if not ok then
	return
end

local cmp = require("cmp")
local exist, _ = pcall(require, "user.config")
local user_config = require("user.config")
local cmp_opts = exist and type(user_config) == "table" and user_config.cmp_setup or {}

---@class cmp.ConfigSchema
local defaults = {
    --[[ completion = {
        autocomplete = {
            cmp.TriggerEvent.TextChanged,
            cmp.TriggerEvent.InsertEnter,
        },
        completeopt = "menu,menuone,noselect",
    }, ]]
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping(
			cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }),
			{ "i" }
		),
		["<Tab>"] = cmp.config.disable,
	},
	-- Order sources are defined are the order they appear on the completion menu
	sorting = {
		-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,

			-- copied from cmp-under, but I don't think I need the plugin for this.
			-- I might add some more of my own.
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,

			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	views = {
		entries = {
			name = "wildmenu",
			selection_order = "near_cursor",
		},
	},
	window = {
		completion = {
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			return kind
		end,
	},
}
local cmp_options = {}
local cmdline_options = {}

-- Take default settings and user settings if they exist and use the users settings over the default
cmp_options = vim.tbl_deep_extend("force", defaults, cmp_opts.cmp)
cmdline_options = vim.tbl_deep_extend("force", cmdline_options, cmp_opts.cmp_cmdline)

-- Setup CMP instances
cmp.setup(cmp_options)
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "cmdline" }
    }, {
        { name = "path" }
    }),
})
